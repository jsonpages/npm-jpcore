# JSONPAGES Spec Hardening v1.3

Status: Draft for adoption  
Audience: Core maintainers, CLI maintainers, tenant owners, enterprise architects  
Scope: Hardening actions required to make JSONPAGES v1.3 investor-ready and enterprise-ready

## Purpose

This document defines a practical hardening layer for JSONPAGES v1.3, using RFC-style language.
The goal is to preserve the current architecture while closing operational gaps across versioning,
runtime parity, machine-readable contracts, and governance controls.

## Normative Language

The key words `MUST`, `SHOULD`, and `MAY` are to be interpreted as described in RFC 2119.

## Hardening Requirements

### 1. Versioning and Deprecation Policy

- `MUST` define semantic versioning guarantees for spec and runtime behavior.
- `MUST` publish deprecation lifecycle for breaking changes: announce date, migration window, removal date.
- `MUST` include migration notes for each breaking release (for example, flat selection to `itemPath`).
- `SHOULD` provide CLI-assisted migration commands for common breaking transitions.

### 2. Runtime Contract Parity (Dev vs Production)

- `MUST` define a normative serving contract for `/{slug}.json` and nested paths `/{nested}/.../{slug}.json`.
- `MUST` document production behavior for static hosting targets (including Vercel).
- `MUST` state required artifacts for production serving (for example, `public/pages/**` availability).
- `SHOULD` ship a reference deployment profile per target (Vercel-native, private cloud, local static).

### 3. Machine-Readable Contract

- `MUST` publish machine-readable schemas for all core payloads (`SiteConfig`, `MenuConfig`, `ThemeConfig`, `PageConfig`).
- `MUST` define schema version identifiers and compatibility rules.
- `MUST` provide conformance test vectors (valid and invalid fixtures).
- `SHOULD` expose an OpenAPI/JSON Schema bundle for tooling and CI integration.

### 4. Error Model and API Semantics

- `MUST` define a standard error envelope with stable fields: `code`, `message`, `details`, `traceId`.
- `MUST` define deterministic status mapping for known failures.
- `MUST` classify failures by category (validation, authorization, conflict, transport, internal).
- `SHOULD` include tenant-safe, user-safe error wording guidance.

### 5. Security and Governance Baseline

- `MUST` define minimum authentication and authorization requirements for write operations.
- `MUST` define an audit event model (who, what, where, when, result).
- `MUST` define rollback/recovery semantics for content mutations.
- `SHOULD` define integrity checks for saved artifacts and mutation provenance.
- `SHOULD` provide an enterprise control matrix (SOC2/ISO-style mapping guidance).

### 6. Editor and Path Determinism Guarantees

- `MUST` keep strict path-based nested selection semantics as normative in v1.3+.
- `MUST` require stable item IDs for editable object arrays in strict mode.
- `MUST` define non-compliance behavior when IDs are missing.
- `SHOULD` provide lints/checks that fail CI on non-deterministic editing patterns.

### 7. Tenant Conformance and CI

- `MUST` define a conformance checklist that can be executed automatically.
- `SHOULD` provide a `spec:check` command for tenant repositories.
- `SHOULD` support a compliance badge generated from CI results.
- `MAY` provide profile-specific conformance levels (core, cloud, enterprise).

### 8. Documentation Packaging for Adoption

- `MUST` keep one normative spec source of truth.
- `MUST` separate normative rules from explanatory onboarding guides.
- `SHOULD` maintain a short “quick contract” document for new adopters.
- `SHOULD` maintain an investor-facing summary with stable product language.

## Recommended Deliverables (Implementation Plan)

### Phase A (Immediate)

- Publish versioning and deprecation policy.
- Publish runtime production contract for `/{slug}.json`.
- Publish error envelope and status mapping.

### Phase B (Near-Term)

- Publish machine-readable schema bundle and conformance vectors.
- Add tenant conformance CI checks.
- Add migration docs and migration helpers.

### Phase C (Enterprise Readiness)

- Publish security baseline and audit event schema.
- Add private-cloud reference profile and control matrix.
- Add rollback and integrity verification guidance.

## Success Criteria

- New tenants can implement compliant `/{slug}.json` serving in dev and production without ad hoc logic.
- Existing tenants can upgrade with deterministic migrations and no hidden breaking behavior.
- CI can validate contract compliance automatically.
- Enterprise buyers can map platform behavior to governance and security requirements.

## Notes

- This hardening plan is additive to JSONPAGES v1.3 architecture and does not replace existing protocols.
- Existing onboarding documents remain valid as implementation guides, while this document defines normative closure criteria.
