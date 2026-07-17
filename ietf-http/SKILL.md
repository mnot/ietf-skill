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



## Creating HTTP Specifications

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


### Linking

### Discovery

### Redirection

## Content

### Content Negotiation

## Methods

Protocols that use HTTP must only use methods that are registered in the IANA HTTP method registry, and will typically confine themselves to the following methods: GET POST PUT DELETE PATCH QUERY

See below for advice about using specific methods.

### GET

### POST

### PUT and DELETE

### PATCH

### QUERY

### Other Methods

### Defining New Methods

Extending HTTP with new methods is rare.

## Status Codes

Classes of status codes


### Defining New Status Codes

Extending HTTP with new status codes is rare, and requires a new IETF consensus specification. Most often, the HTTP Working Group (httpbis) is the appropriate venue for their discussion, although other Working Groups that are chartered to work on specific HTTP extensions might too.

Specifications that propose a new status code MUST NOT "squat" on a code by choosing their own number; this will be done later in the Working Group process. Before that happens, always refer to the proposed status code using its top-level category number followed by two placeholder characters; e.g., "4xx" or "5nn".

Status codes are generic; they MUST NOT be specific to a particular application or domain of use. They MUST be potentially applicable to all HTTP resources. See [Considerations for New Status Codes](https://httpwg.org/specs/rfc9110.html#considerations.for.new.status.codes).

Status codes MUST be defined in standalone documents. Experience shows that when they are defined as part of an application or domain specific protocol, readers will assume that they are only to be used in that circumstance.

## Header and Trailer Fields

### Defining New Fields

HTTP fields defined in the IETF should be [Structured Fields](https://httpwg.org/specs/rfc9651.html). This isn’t an official policy, but many participants will argue that their interoperability and security benefits override most other concerns, so failing to use them may cause issues during Last Call.

## Caching


## Security


## Anti-Patterns

### Tunnelling

Overuse of POST

### GET with Body

### Mandatory Features

### Subsuming Generic Semantics



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