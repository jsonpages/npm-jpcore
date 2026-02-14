/**
 * 🧩 SHARED TYPES
 * Contracts shared between the Admin Engine and the Input Registry.
 * In the Monorepo, this will live in @jsonpages/shared-data.
 */

export interface BaseWidgetProps<T = unknown> {
  label: string;
  value: T;
  onChange: (val: T) => void;
  options?: string[]; // For Select/Enum widgets
}



