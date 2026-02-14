/**
 * 📡 STUDIO EVENT PROTOCOL
 * Single Source of Truth for cross-frame communication.
 */
export const STUDIO_EVENTS = {
  // Parent -> Child (Data Injection)
  UPDATE_DRAFTS: 'jsonpages:update-drafts',
  
  // Parent -> Child (ICE Control)
  SYNC_SELECTION: 'jsonpages:sync-selection',
  
  // Parent -> Child (Bake Handshake)
  REQUEST_CLEAN_HTML: 'jsonpages:request-clean-html',
  
  // Child -> Parent (Bake Response)
  SEND_CLEAN_HTML: 'jsonpages:send-clean-html',
  
  // Child -> Parent (User Interaction)
  SECTION_SELECT: 'jsonpages:section-select',
  
  // Child -> Parent (Lifecycle)
  STAGE_READY: 'jsonpages:stage-ready',
} as const;

