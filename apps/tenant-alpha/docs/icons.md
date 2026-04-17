# Icons

OlonJS uses a tenant-owned icon registry. Core ships no icons.

## How it works

1. The tenant declares icons in `src/lib/IconResolver.tsx`
2. The tenant passes `iconMap` as `iconRegistry` in `App.tsx`
3. Core reads `iconRegistry` via `IconRegistryContext` and renders them in the `ui:icon-picker` widget

## Adding an icon

**1. Add the import and entry in `src/lib/IconResolver.tsx`:**

```ts
import { Mail, Phone } from 'lucide-react';

export const iconMap = {
  'mail': Mail,
  'phone': Phone,
  // ...
} as const satisfies Record<string, LucideIcon>;
```

**2. `App.tsx` already passes `iconMap` — no changes needed:**

```ts
import { iconMap } from '@/lib/IconResolver';

const config: JsonPagesConfig = {
  // ...
  iconRegistry: iconMap,
};
```

## Supported libraries

Currently only [Lucide React](https://lucide.dev) is supported.

## Using icons in a section schema

```ts
icon: z.string().optional().describe('ui:icon-picker'),
```

## Rendering icons in a View

```tsx
import { Icon } from '@/lib/IconResolver';

{data.icon && (
  <div data-jp-field="icon">
    <Icon name={data.icon} size={24} />
  </div>
)}
```
