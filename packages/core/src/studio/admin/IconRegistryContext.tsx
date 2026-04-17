import { createContext, useContext } from 'react';
import type { LucideIcon } from 'lucide-react';

export type IconRegistry = Record<string, LucideIcon>;

export const IconRegistryContext = createContext<IconRegistry>({});

export const useIconRegistry = (): IconRegistry => useContext(IconRegistryContext);
