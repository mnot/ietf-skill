---
name: ietf-http
description: Guidelines for how IETF protocol specifications that use or extend HTTP should be written. Use to assist in reviewing draft specifications, creating new ones, or refining existing ones.
license: CC-BY-4.0
---

# HTTP Review Skill

Drafting, reviewing, or modifying IETF Internet-Drafts and similar specifications that use the HTTP protocol. Covers editorial style, best practices, and common pitfalls.

This skill is not designed for use without human supervision; it does not capture all relevant information and leaves many decisions to discretion / taste. Many of its recommendations are just that -- their application depends upon the specific circumstances and goals of the use of HTTP in question. When a particular behaviour is required or prohibited in IETF specifications, MUST / MUST NOT will be used.

The content of this skill mirrors much of the content of BCP 56 / RFC 9205.

First, confirm that HTTP is being used by the specification in question; see "Is HTTP Being Used?"

From there:
* If you are reviewing a specification that uses HTTP, follow the steps in "Review Process".
* If you are creating a specification that uses HTTP, follow the steps in "Creating HTTP Specifications".


## Is HTTP Being Used?

A specification is using HTTP -- and so this skill applies -- if it defines an application that does any of the following:

* uses transport port 80 or 443, or
* uses the "http" or "https" URI scheme, or
* uses an ALPN protocol ID that generically identifies HTTP (e.g., "http/1.1", "h2", "h3"), or
* makes registrations in, or overall modifications to, the IANA registries defined for HTTP.

When a specification is using HTTP, all of the requirements of the HTTP protocol suite are in force -- RFC 9110 in particular, but also the specific version(s) of HTTP in use and any extensions.

An application can rely on HTTP without meeting these criteria -- for example, reusing its message format while changing other aspects of its operation. Doing so buys freedom to modify the protocol, at the cost of most of the benefits in "Goals for Using HTTP", because existing implementations won't easily adapt. Such specifications MUST NOT use HTTP's URI schemes, transport ports, ALPN protocol IDs, or IANA registries; they are encouraged to establish their own.

Note that this skill addresses applications that use HTTP, not generic extensions to HTTP; the guidance here does not necessarily apply to the latter.


## Creating HTTP Specifications

Specify the application's server-side behaviour by defining these protocol elements, and composing them into a set of resources:

* media types, often based on a format convention such as JSON;
* HTTP fields, per "Header and Trailer Fields"; and
* the behaviour of resources, as identified by link relations.

Between them, these can express retrieval of resource state with GET, creation or update with POST or PUT, data processing with POST, and deletion with DELETE -- without the specification fixing any URL. For example:

> Resources linked to with the "example-widget" link relation type are Widgets. The state of a Widget can be fetched in the "application/example-widget+json" format, and can be updated by PUT to the same link. Widget resources can be deleted.

Client behaviour ought to be closely aligned with that of Web browsers, to avoid interoperability problems when browsers are used. If browser compatibility is a goal, define client interaction in terms of [Fetch](https://fetch.spec.whatwg.org), since that is the abstraction browsers use for HTTP.

Some client behaviours and extensions aren't required by HTTP but have become common; if the specification doesn't address them explicitly, expect confusion:

* Redirects: specify how they are to be handled (see "Redirection").
* Cookies: reference the Cookie specification explicitly if they are required.
* Certificates: specify that TLS certificates are checked per Section 4.3.4 of HTTP when HTTPS is used.

Use RFC 9110 as the primary reference for HTTP; referencing the rest of the suite is only necessary when a specific feature is called out.

It is NOT RECOMMENDED that a specification require a minimum version of HTTP; because HTTP is hop-by-hop, connections can be handled by implementations the application doesn't control (proxies, CDNs, firewalls). If a deployment benefits from a particular version (e.g., HTTP/2's multiplexing), note that instead. Specifications MUST NOT specify a maximum version, to preserve the protocol's ability to evolve.


## Review Process

To review a specification that uses HTTP, go through the following steps. 

* What section(s) of the specification use or extend HTTP?
* What section(s) of the document have other interactions with HTTP?
* Identify the HTTP extensions proposed by the specification.
* Apply the guidelines in "Editorial Style".
* Check that the correct documents are referenced correctly.

### Review Template


## Goals for Using HTTP

Reuse of infrastructure:
* Browsers
* CDNs, proxy caches, other intermediaries
* WAFs and other security infrastructure
* Servers
* Frameworks and tooling

Evolution

Deployment flexibility

Separation of interface and implementation 

Scalability

Higher Level Semantics

Mindshare




## Resources and URIs

Parts of the URL are designed to be under the control of the server's owner, to give them flexibility in deployment. As a result, specifications for applications that use HTTP won't usually contain fixed URLs or paths; specifying a path prefix like "/app/v1" is common practice for a single-deployment API, but inappropriate in an IETF specification. See [BCP 190](https://www.rfc-editor.org/rfc/rfc8820).

Applications will typically use the "http" and/or "https" URI schemes; "https" is RECOMMENDED, to provide authentication, integrity, and confidentiality and to mitigate pervasive monitoring. An application-specific scheme can be defined, but the trade-offs are severe: browsers and existing clients, intermediaries, and servers won't recognise it; URLs are often generated automatically, so consistent use is hard to guarantee; the resources remain available over "http" and/or "https" anyway, so those URLs can leak; and origin-based features (same-origin policy, cookies, authentication, caching, HSTS, CORS, secure contexts) may not work as expected, because they generally assume the scheme is "http" or "https".

Applications can use the default port (80 for HTTP, 443 for HTTPS) or be deployed on another; this is usually a deployment-time decision. A non-default port has to be reflected in the authority of every URL for the resource -- the only way to change a default port is to change the URI scheme. Using a non-default port has privacy implications (the protocol can now be distinguished from other traffic) that should be documented in Security Considerations, as well as operability concerns, since some networks block or interfere with it.

### Linking

Assuming that a server's namespace (or a portion of it) is exclusively for one application's use overlays application-specific semantics onto that space and precludes others from using it. Such "squatting" usurps the server's authority over its own resources and is bad practice in standards.

Instead of statically defining URI components like paths, it is RECOMMENDED that applications define and use links. Beyond deployment flexibility, links let a request be routed to a different server without the overhead of a redirect, allow different applications to be "mixed and matched" on the same server, offer a natural mechanism for extensibility and capability management (since the document carrying the links can also describe their targets), and provide a form of cache invalidation -- when a resource's state changes, change the affected links so that a fresh copy is fetched.

Applications can also use URI Templates to let clients generate URLs from runtime data.

### Discovery

A client typically begins by fetching an initial document that describes the particular deployment and links to other relevant resources. This keeps the deployment flexible (potentially spanning multiple servers), allows evolution, and lets the application tailor the discovery document to the client. Once fetched, it can be cached (if its metadata allows) and used to locate the application's other resources.

The most straightforward way for a client to find that initial URL is to be configured with the full URL. If the client only knows the server's hostname and the identity of the application, a specification can instead:

* register a well-known URI as an entry point, giving a fixed path on every potential server that won't collide with other applications; or
* enable the server authority to convey a URI Template (or similar) for generating an entry point URL -- for example, in a configuration document.

An application that doesn't want a discovery document -- because communication is very brief, or the added latency is unacceptable -- can place all of its resources under a well-known location.

### Redirection

The 3xx status codes direct the user agent to another resource. The most common -- 301, 302, 307, and 308 -- all use the Location response header field, and differ along two axes:

| | Permanent | Temporary |
| --- | --- | --- |
| Allows change of the request method from POST to GET | 301 | 302 |
| Does not allow change of the request method | 308 | 307 |

Permanent redirects can be used to update links stored in the client (e.g., bookmarks); temporary ones cannot. This is separate from HTTP caching and has no effect on it. Browsers generally do change POST to GET for 301 and 302, which is why 307 and 308 were created. 303 (See Other) informs the client that the result of an operation is available at a different location using GET.

A user agent is allowed to follow a 3xx redirect with a Location header field automatically, even if it doesn't understand the specific status code -- but it isn't required to. If an application needs redirects to be followed automatically, it MUST say so, specifying the circumstances.

Redirects can be cached when appropriate cache directives are present, but they aren't "sticky": redirecting one URI doesn't imply that similar URIs (e.g., with different query parameters) are redirected.

Applications are encouraged to specify that 301 and 302 change the subsequent request method from POST (but no other method) to GET, for compatibility with browsers. A redirected request's header fields are generally copied from the original, but some change -- e.g., Authorization and Cookie will change if the origin (and sometimes path) changes. If a request header field the application defines needs to be modified or removed on redirect, say so -- but don't rely on it, since generic clients won't be aware of the requirement.

## Content

Common syntactic conventions for message content include JSON, XML, and CBOR; best practices for their use are out of scope here.

Applications should register a distinct media type for each format they define, so that it can be identified unambiguously and negotiated for.

### Content Negotiation

## Methods

Protocols that use HTTP must only use methods that are registered in the IANA HTTP method registry, and will typically confine themselves to the following methods: GET POST PUT DELETE PATCH QUERY

See below for advice about using specific methods.

### GET

GET is the most common and useful method; its retrieval semantics allow caching and side-effect-free linking, and underlie many of the benefits of using HTTP.

Queries can be performed with GET, usually using the query component of the URL -- a familiar pattern from Web browsing, with the advantage that results can be cached. GET can be unwieldy for larger queries, though: binary query terms have to be encoded to conform to URI syntax, and some implementations limit URL size (modern software typically allows considerably more than the 8000 octets required by HTTP). An application might therefore consider expressing queries in the content of a POST, at the cost of losing caching and the ability to link to query results; applications that need POST queries ought to consider allowing both methods.

Processing of a GET should not change application state or have other side effects significant to the client, since implementations do retry failed GETs, and GETs protected by TLS early data may be vulnerable to replay. This does not include logging and similar functions.

### POST

POST is the appropriate method for data processing, and for resource creation or update where the client isn't supplying the target URL. See also "GET" (for queries) and "Overuse of POST".

Because a browser can be coaxed into cross-site request forgery (CSRF) from an arbitrary site, an application whose state can be changed with POST needs to consider browsers even if it doesn't intend to be used by one; see "Security".

### PUT and DELETE

PUT creates or updates the state of a resource at a known URL; DELETE removes it.

### PATCH

### QUERY

### Other Methods

OPTIONS is often considered for retrieving metadata, because HTTP-based APIs frequently need it, but it has significant limitations:

* Metadata can't be linked to with a simple URL, because OPTIONS is not the default method.
* OPTIONS responses aren't cacheable; HTTP caches operate on representations (i.e., GET and HEAD). Caching them separately requires considering interactions with cache expiry, secondary keys, and other mechanisms.
* It is "chatty" -- retrieving metadata separately increases the number of requests.
* Implementation support isn't universal; some servers can't easily respond to OPTIONS at all.

Usually one of these is a better fit:

* For server-wide metadata, create a well-known URI, or use an existing one if appropriate.
* For metadata about a specific resource, create a separate resource and link to it with a Link response header field or a link in the response's content. The Link header field is available on HEAD responses, which is useful when a client wants to discover a resource's capabilities before interacting with it.

### Defining New Methods

Extending HTTP with new methods is rare. New methods require IETF Review for registration, and MUST be generic -- potentially applicable to all resources, not just those of one application. Some applications have historically defined application-specific methods; HTTP now forbids this.

When authors believe a new method is required, they are encouraged to engage with the HTTP community early (e.g., on the ietf-http-wg@w3.org mailing list) and to document the proposal as a separate HTTP extension, not as part of an application's specification.

## Status Codes

Status codes are generic; they convey semantics both to generic HTTP components -- caches, intermediaries, clients -- and to applications. Applications encounter two recurring pitfalls in using them.

First, status codes are often generated by something other than the application: by network errors, captive portals, proxies, CDNs, an overloaded server, or generic client software. If an application assigns specific semantics to such a status code, a client can be misled about its state.

Second, mapping application errors one-to-one onto status codes exhausts the finite space of applicable codes, which in turn encourages minting application-specific codes or reusing existing ones whose semantics barely fit.

Therefore, applications should:

* Use the most applicable status code, making generous use of the general codes (200, 400, and 500) when in doubt.
* Not specify a one-to-one relationship between status codes and application errors.
* Convey finer-grained error information in the response's content and/or header fields; [Problem Details](https://www.rfc-editor.org/rfc/rfc9457) is one way to do so.
* Point out explicitly that clients ought to handle all applicable status codes gracefully, falling back to the generic n00 semantics of a code they don't recognise (e.g., handling 499 as 400). This is preferable to a "laundry list" of potential status codes, which won't stay complete.

Applications MUST only use registered status codes, and MUST NOT re-specify their semantics -- even by copying their definition. It is NOT RECOMMENDED that specific reason phrases be required; the reason phrase has no function in HTTP, isn't guaranteed to be preserved, and isn't carried at all in HTTP/2.

### Defining New Status Codes

Extending HTTP with new status codes is rare, and requires a new IETF consensus specification. Most often, the HTTP Working Group (httpbis) is the appropriate venue for their discussion, although other Working Groups that are chartered to work on specific HTTP extensions might too.

Specifications that propose a new status code MUST NOT "squat" on a code by choosing their own number; this will be done later in the Working Group process. Before that happens, always refer to the proposed status code using its top-level category number followed by two placeholder characters; e.g., "4xx" or "5nn".

Status codes are generic; they MUST NOT be specific to a particular application or domain of use. They MUST be potentially applicable to all HTTP resources. See [Considerations for New Status Codes](https://httpwg.org/specs/rfc9110.html#considerations.for.new.status.codes).

Status codes MUST be defined in standalone documents. Experience shows that when they are defined as part of an application or domain specific protocol, readers will assume that they are only to be used in that circumstance.

## Header and Trailer Fields

Defining a new field is appropriate when at least one of the following holds:

* the field is useful to intermediaries, who often wish to avoid parsing message content;
* the field is useful to generic HTTP software (e.g., clients, servers); or
* the value can't be carried in the message content, usually because the format doesn't allow it.

Otherwise, it is usually better to convey application-specific information elsewhere -- in the message content, or the URL's query string.

The semantics of existing fields MUST NOT be redefined without updating their registration or defining an extension to them (where that is allowed). For example, an application cannot specify that the Location header field has a special meaning in a certain context.

Request header fields used to select ("vary") a response have consequences for caching, and need careful consideration; see "Caching". Fields that carry application state (e.g., Cookie) have their own considerations; see "Security".

### Defining New Fields

New fields MUST be registered.

HTTP fields defined in the IETF should be [Structured Fields](https://httpwg.org/specs/rfc9651.html). This isn’t an official policy, but many participants will argue that their interoperability and security benefits override most other concerns, so failing to use them may cause issues during Last Call.

Field names should be short -- there is overhead even when field compression is used -- but appropriately specific. A field that is specific to an application can use an identifier for that application as a prefix, separated by a hyphen; e.g., the "example" application might define "example-foo", "example-bar", and "example-baz". The motivation is to avoid consuming more generic field names, not to reserve a portion of the namespace for the application.

## Caching

Caching is one of the primary benefits of using HTTP: it provides scalability, reduces latency, and improves reliability, and caches are readily available in browsers and other clients, in networks as forward and reverse proxies, in CDNs, and in server software. Even an application that isn't designed to take advantage of caching needs to consider how caches will handle its responses, so that behaviour stays correct when one is interposed.

Assigning even a short freshness lifetime -- e.g., 5 seconds -- allows a response to be reused across multiple clients, or by one client repeating a request. In general, if it is safe to reuse something, consider assigning a freshness lifetime. Notes on doing so:

* The most common method is the max-age response directive. Expires also works, but isn't necessary; all modern caches support Cache-Control, and a delta is more convenient and less error-prone.
* The public response directive is not needed for most responses; it is only necessary to store an authenticated response, or when the status code isn't understood by the cache and there is no explicit freshness information.
* Responses without explicit freshness directives may be stored and served using a heuristic freshness lifetime. The heuristic isn't under the application's control, so it is generally preferable to set an explicit lifetime or make the response explicitly uncacheable.
* To prevent caching, the appropriate directive is no-store; no other directives are needed. Despite its name, no-cache allows a response to be stored -- it only prevents reuse without validation.

Stale responses (e.g., with `Cache-Control: max-age=0`) can be reused by caches when disconnected from the origin server, which can be useful for handling network issues. If that isn't suitable for a given response, send the must-revalidate directive. Assigning a validator lets stale responses be refreshed, saving both bandwidth and latency for large responses.

When an application needs to express a lifetime separate from the freshness lifetime, convey it separately -- in the response's content, or a separate header field -- and consider the relationship between the two carefully, since the response will be used for as long as it is considered fresh. In particular, consider how responses that aren't freshly obtained from the origin should be handled: a concept like a validity period will need to account for the age of the response. One way to address this is to specify explicitly that responses need to be fresh upon use.

If a request header field changes the response's header fields or content, point out that this has caching implications: such resources need either to make their responses uncacheable, or to send Vary on all responses from that resource -- including the "default" response.

## Security

Even if an application isn't intended to be used with a Web browser, its resources remain available to browsers and other HTTP clients, so every application that uses HTTP needs to consider how browsers will interact with it. If application state can be changed with POST, a browser can easily be coaxed into cross-site request forgery (CSRF) from an arbitrary site. If an attacker gains control of content returned by the application's resources -- for example, part of the request is reflected in the response -- they can inject code into the browser and access data and capabilities as if they were the origin, a cross-site scripting (XSS) attack.

The best approach is to consider the application as a Web application and follow best practices for secure development of one. A complete enumeration is out of scope, but some considerations:

* Use an application-specific media type in Content-Type, and require clients to fail if it isn't used.
* Use `X-Content-Type-Options: nosniff` so that attacker-controlled content can't be coaxed into a form a browser interprets as active content.
* Use Content-Security-Policy to constrain the capabilities of active content, mitigating XSS.
* Use Referrer-Policy to prevent sensitive data in URLs leaking in the Referer request header field.
* Use the 'HttpOnly' flag on cookies so that they aren't exposed to browser scripting languages.
* Avoid compressing sensitive information (e.g., authentication tokens, passwords); the scripting environment browsers offer allows an attacker to repeatedly probe the compression space, and an attacker on the network path can use that to recover the information.

For example, a response from an application that doesn't intend its content to be treated as active:

~~~ http-message
HTTP/1.1 200 OK
Content-Type: application/example+json
X-Content-Type-Options: nosniff
Content-Security-Policy: default-src 'none'
Cache-Control: max-age=3600
Referrer-Policy: no-referrer

[ content ]
~~~

Depending on the intended deployment, a specification might require these mechanisms in specific ways, or merely point them out in Security Considerations.

Applications can use cookies to identify a client or store client-specific data, and HTTP authentication to identify clients. In both cases, specify their scoping and use carefully: if the application exposes sensitive data or capabilities -- e.g., by acting as an ambient authority -- exploits are possible. Mitigations include using a request-specific token to ensure the intent of the client. Note that Basic and Digest are not suitable unless the channel is secure, and that TLS client certificate authentication is scoped to the underlying transport connection, so a client has no way of knowing whether the authenticated status was used in preparing a response.

Because many HTTP capabilities are scoped to the origin, consider how a deployment might interact with other applications -- including Web browsing -- on the same origin server. Cookies, for example, are sent with all requests to the origin by default unless scoped by path, so the application might receive cookies from other applications, leading to security issues and name collisions. Requiring a dedicated hostname solves this, but it is often desirable to allow multiple applications on one hostname, since that gives the most deployment flexibility. Applications should therefore strive to allow multiple applications on an origin: when specifying the use of cookies, HTTP authentication realms, or other origin-wide mechanisms, don't mandate a particular name -- let deployments configure it, and consider scoping to part of the origin using the mechanisms specified for doing so. Applications that wish to expose cross-origin data to browsers will need to implement CORS.

Privacy considerations deserve their own attention. Beyond what is sent explicitly and what is visible on the wire (one of the reasons "https" is recommended), information can be gathered by connecting a user's activities over time:

* Session information -- the client's IP address, TLS session tickets, cookies, ETags stored in the client's cache, and other stateful mechanisms. Avoid session mechanisms unless they are unavoidable or necessary for operation; when they are used, document the risks and encourage implementations to allow clearing the state.
* Fingerprinting -- unique aspects of a client's messages and behaviour, such as User-Agent and Accept-Language, which in combination can uniquely identify a client. Specify that clients should only emit the information they need to function.
* Code execution -- if the application exposes the ability to execute code, any ability to observe the environment can be used both to fingerprint the client and to obtain and manipulate private data. For example, access to high-resolution timers can profile the underlying hardware. Avoid mobile code where possible; where it can't be avoided, scrutinise the resulting security properties carefully.

Finally, note that applications that require modification of implementations -- a new URI scheme, a non-standard method -- risk having those implementations "fork" from their parent HTTP implementations, and so not benefit from security improvements made upstream.

## Anti-Patterns

### Tunnelling

Overuse of POST

### GET with Body

The generic HTTP syntax allows a GET request to contain content, but only so that message parsers can be generic. Content in a GET is not recommended, has no meaning, and will be ignored or rejected by generic HTTP software -- intermediaries, caches, servers, and client libraries. Use the query component, or POST; see "GET".

### Mandatory Features

Applications should not require clients to statically support HTTP features that are usually negotiated. For example, requiring support for responses with a certain content coding, instead of negotiating for it, means that otherwise conformant clients cannot interoperate with the application. Encouraging implementation of such features is fine.

Similarly, don't require a minimum or maximum version of HTTP; see "Creating HTTP Specifications".

### Subsuming Generic Semantics

Much of the value of HTTP is in its generic semantics: the protocol elements HTTP defines are potentially applicable to every resource, and aren't specific to a particular context. That split lets a message be handled by common software -- servers, intermediaries, client implementations, caches -- without those implementations understanding the application, and lets people apply their knowledge of HTTP without specialised knowledge of the application.

Applications that use HTTP therefore MUST NOT redefine, refine, or overlay the semantics of generic protocol elements such as methods, status codes, or existing header fields. Application-specific semantics belong in message content and in fields the application defines -- and specifications should focus on the protocol elements that are specific to the application, namely its resources.

A related trap is specifying exactly how HTTP is to be implemented and used, which easily produces an unintended profile of HTTP behaviour. For example:

> A POST request MUST result in a 201 (Created) response.

This forms an expectation in the client that the response will always be 201, when in fact a real deployment might return something else -- a proxy requiring authentication, a server-side error, a redirect. If the client doesn't anticipate that, the deployment is brittle.



## Editorial Style

The following guidelines apply to IETF specifications that define, extend, or use HTTP.

### Header and Trailer Fields

When defining a field, the first instance should be quoted; e.g.,

> This document defines the "Foo" response header field.

If the field is specific to headers, trailers, requests, and/or responses, the definition should include the relevant terms, as above.

When referring to a field defined in a different document, the first instance should include a reference, and all instances should be unquoted. For example:

> Add the Foo-Example header field (see {{RFCxxxx}}) to the response.

Subsequent occurrences should be unquoted, but always be followed by “field”, “header field”, or “trailer field” as appropriate.

See also [Considerations for New Fields](https://httpwg.org/specs/rfc9110.html#considerations.for.new.fields).

### Structured Fields

When specifying a Structured Field in prose, preferred practice is to add the following to your “Notational Conventions” section:

> This document uses the following terminology from {{Section 3 of STRUCTURED-FIELDS}}
> to specify syntax and parsing: List, Dictionary, and Integer.

adjusting the terms listed as appropriate. Then, when using one of the terms, just use the bare,  capitalised term; e.g.,

> The Foo header field’s value is a List of Integers.

All references to structured types should be made to Section 3 of the Structured Fields specification, not Section 4.

Although ABNF is defined for structured types, we do not recommend its use. The current reference for Structured Fields is RFC 9651, not RFC 8941.

### Content

Use ‘content’, not ‘body’ or ‘payload’.

### Methods

Just use the bare method name (without quotes or emphasis); e.g.,

> Send a request with the GET method.

Stating that it is a HTTP method is optional; this is equally acceptable:

> Send a GET request.

### Status Codes

Use the bare status code number, followed by the reason phrase in parentheses. For example:

> The 500 (Internal Server Error) status code.

When referring to multiple individual status codes, the reason phrase can be omitted; for example:

> If the status code is 200, 202, or 204, proceed.

To refer to a range of status codes, use “xx” notation:

> The 4xx range of status codes.

When discussing status codes in general, the correct reference is Section 15 of HTTP. Use ‘status code’, not ‘Status Code’.

### Example Messages

If your specification has examples of HTTP messages (and it probably should), they should give enough context for readers to understand. Generally, this means showing a substantial portion of the message; e.g., not just a header field in isolation, but an entire request or response message (with a truncated body if applicable). Where appropriate, an entire exchange (request and response) can be illustrated using two subsequent example sections.

Examples should be in HTTP/1.1 format unless they are specific to another version of the protocol. HTTP/1.1 examples should be labeled with the http-message type so that the validator can check them.

For example (in Markdown):

~~~ http-message
HTTP/1.1 200 OK
Content-Type: text/plain
Example-Header: foo

[ content ]
~~~

Examples with long lines (over 78 characters) should be wrapped using the line folding convention where possible. For example:

~~~ http-message
HTTP/1.1 200 OK
Content-Type: text/plain
Example-Header: this content is very long so we
   fold it to the next line and indent

[ content ]
~~~

If the too-long content cannot include whitespace, use RFC 8792 encoding:

~~~ http-message
# NOTE: '\' line wrapping per RFC 8792

HTTP/1.1 200 OK
Content-Type: text/plain
Example-Header: abcedfghijlkmnopqrstuvwxyzabcedfghijlkmnopqrstuvwxyzabc\
     edfghijlkmnopqrstuvwxyz

[ content ]
~~~

Note that the notice header has to occur on each section that uses this encoding.

### References

Generally, named references are preferred for “core” specifications like HTTP and TLS. In addition to giving readers a cue about the purpose of the reference, this is a small hint that the RFC number is not the identifier they should be remembering. For example:

> This document defines a HTTP {{HTTP}} header field that uses the conventions
> in {{STRUCTURED-FIELDS}} to convey information about the TLS ({{TLS}}) session.

The following reference names are preferred (but not required):

* HTTP - HTTP Semantics (RFC 9110)
* HTTP-CACHING - HTTP Caching (RFC 9111)
* HTTP/1.1 - HTTP/1.1 (RFC 9112)
* HTTP/2 - HTTP/2 (RFC 9113)
* HTTP/3 - HTTP/3 (RFC 9114)
* STRUCTURED-FIELDS - Structured Field Values for HTTP (RFC 9651)
* COOKIES - Cookies: HTTP State Management Mechanism (RFC 6265)
* TLS - The Transport Layer Security (TLS) Protocol Version 1.3 (RFC 9846)

Specifications MUST reference the most recent RFC (see above).

Note that to include / in an anchor name in markdown, the reference needs to be declared in the YAML header like this:

~~~yaml
normative:
  RFC9112:
    display: HTTP/1.1
~~~