// Minimal fallback for phoenix-colocated hooks when the npm package
// is not available in the build environment.

const globalScope = typeof window !== "undefined" ? window : globalThis
const registeredHooks = globalScope.__phoenix_colocated_hooks__ || {}

export const hooks = registeredHooks


