import React, { useState } from 'react';
import { Input } from '../components/ui/input';
import { Textarea } from '../components/ui/textarea';
import { Checkbox } from '../components/ui/checkbox';
import { Label } from '../components/ui/label';
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '../components/ui/select';
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
  DialogClose,
} from '../components/ui/dialog';
import { Button } from '../components/ui/button';
import {
  Layers,
  Github,
  ArrowRight,
  Box,
  Terminal,
  ChevronRight,
  Menu,
  X,
  Sparkles,
  Zap,
  ImageIcon,
  type LucideIcon,
} from 'lucide-react';

/** Lucide icon names and components for the icon picker (most useful 10). Keep in sync with tenant IconResolver if used. */
const ICON_PICKER_OPTIONS: { name: string; Icon: LucideIcon }[] = [
  { name: 'layers', Icon: Layers },
  { name: 'github', Icon: Github },
  { name: 'arrow-right', Icon: ArrowRight },
  { name: 'box', Icon: Box },
  { name: 'terminal', Icon: Terminal },
  { name: 'chevron-right', Icon: ChevronRight },
  { name: 'menu', Icon: Menu },
  { name: 'x', Icon: X },
  { name: 'sparkles', Icon: Sparkles },
  { name: 'zap', Icon: Zap },
];
import { BaseWidgetProps } from '../lib/shared-types';
import { useConfig } from '../lib/ConfigContext';
import { cn } from '../lib/utils';
import { resolveAssetUrl } from '../utils/asset-resolver';

export const InputWidgets = {
  'ui:text': ({ label, value, onChange }: BaseWidgetProps<string>) => (
    <div className="grid w-full items-center gap-1.5 mb-4">
      <Label className="text-[9px] uppercase font-black tracking-widest text-zinc-500">
        {label}
      </Label>
      <Input 
        type="text" 
        className="h-7 text-[11px] bg-zinc-900/50 border-zinc-800 focus-visible:ring-blue-600"
        value={value || ''} 
        onChange={(e) => onChange(e.target.value)} 
      />
    </div>
  ),

  'ui:textarea': ({ label, value, onChange }: BaseWidgetProps<string>) => (
    <div className="grid w-full gap-1.5 mb-4">
      <Label className="text-[9px] uppercase font-black tracking-widest text-zinc-500">
        {label}
      </Label>
      <Textarea 
        className="min-h-[80px] text-[11px] bg-zinc-900/50 border-zinc-800 focus-visible:ring-blue-600 resize-none"
        value={value || ''} 
        onChange={(e) => onChange(e.target.value)} 
      />
    </div>
  ),

  'ui:select': ({ label, value, onChange, options = [] }: BaseWidgetProps<string>) => (
    <div className="grid w-full gap-1.5 mb-4">
      <Label className="text-[9px] uppercase font-black tracking-widest text-zinc-500">
        {label}
      </Label>
      <Select value={value || ""} onValueChange={onChange}>
        <SelectTrigger className="w-full h-7 text-[11px] bg-zinc-900/50 border-zinc-800 focus:ring-blue-600">
          <SelectValue placeholder={`Select...`} />
        </SelectTrigger>
        <SelectContent className="dark">
          {options.map((opt) => (
            <SelectItem key={opt} value={opt} className="text-[11px]">
              {opt}
            </SelectItem>
          ))}
        </SelectContent>
      </Select>
    </div>
  ),

  'ui:checkbox': ({ label, value, onChange }: BaseWidgetProps<boolean>) => (
    <div className="flex items-center space-x-2 mb-4 p-2 rounded border border-zinc-800/50 bg-zinc-900/20">
      <Checkbox 
        id={label} 
        checked={!!value} 
        onCheckedChange={(checked) => onChange(checked === true)} 
      />
      <Label 
        htmlFor={label} 
        className="text-[11px] font-medium cursor-pointer select-none text-zinc-300"
      >
        {label}
      </Label>
    </div>
  ),

  'ui:image-picker': ({ label, value, onChange }: BaseWidgetProps<string>) => {
    const { tenantId = 'default' } = useConfig();
    const [open, setOpen] = useState(false);
    const [pathInput, setPathInput] = useState(value || '');
    const resolvedUrl = value ? resolveAssetUrl(value, tenantId) : '';

    const handleOpenChange = (next: boolean) => {
      setOpen(next);
      if (next) setPathInput(value || '');
    };

    const handleApply = () => {
      const trimmed = pathInput.trim();
      onChange(trimmed || '');
      setOpen(false);
    };

    return (
      <div className="grid w-full gap-1.5 mb-4">
        <Label className="text-[9px] uppercase font-black tracking-widest text-zinc-500">
          {label}
        </Label>
        <Dialog open={open} onOpenChange={handleOpenChange}>
          <DialogTrigger asChild>
            <Button
              variant="outline"
              className="w-full h-20 rounded-md border border-zinc-800 bg-zinc-900/50 hover:bg-zinc-800/50 flex flex-col items-center justify-center gap-1 text-zinc-500"
            >
              {resolvedUrl ? (
                <img
                  src={resolvedUrl}
                  alt=""
                  className="max-h-14 max-w-full object-contain rounded"
                  onError={(e) => {
                    (e.target as HTMLImageElement).style.display = 'none';
                  }}
                />
              ) : (
                <ImageIcon className="h-8 w-8" />
              )}
              <span className="text-[10px] font-medium">Choose image</span>
            </Button>
          </DialogTrigger>
          <DialogContent className="sm:max-w-md">
            <DialogHeader>
              <DialogTitle>Image path</DialogTitle>
              <DialogDescription>
                Enter the asset path (e.g. images/hero.jpg). It will be resolved via resolveAssetUrl.
              </DialogDescription>
            </DialogHeader>
            <div className="grid gap-2 py-2">
              <Label htmlFor="image-path" className="text-xs">
                Path
              </Label>
              <Input
                id="image-path"
                value={pathInput}
                onChange={(e) => setPathInput(e.target.value)}
                placeholder="images/photo.jpg"
                className="h-8 text-xs bg-zinc-900/50 border-zinc-800"
              />
            </div>
            <DialogFooter>
              <DialogClose asChild>
                <Button variant="outline" type="button">
                  Cancel
                </Button>
              </DialogClose>
              <Button type="button" onClick={handleApply}>
                Apply
              </Button>
            </DialogFooter>
          </DialogContent>
        </Dialog>
      </div>
    );
  },

  'ui:icon-picker': ({ label, value, onChange }: BaseWidgetProps<string>) => {
    const [open, setOpen] = useState(false);
    const selected = ICON_PICKER_OPTIONS.find((o) => o.name === (value || ''));

    return (
      <div className="grid w-full gap-1.5 mb-4">
        <Label className="text-[9px] uppercase font-black tracking-widest text-zinc-500">
          {label}
        </Label>
        <Dialog open={open} onOpenChange={setOpen}>
          <DialogTrigger asChild>
            <Button
              variant="outline"
              className="w-full h-9 rounded-md border border-zinc-800 bg-zinc-900/50 hover:bg-zinc-800/50 flex items-center gap-2 text-left"
            >
              {selected ? (
                <>
                  <selected.Icon size={16} className="text-zinc-400 shrink-0" />
                  <span className="text-[11px] text-zinc-300 capitalize truncate">{selected.name}</span>
                </>
              ) : (
                <>
                  <ImageIcon size={16} className="text-zinc-500 shrink-0" />
                  <span className="text-[11px] text-zinc-500">Choose icon...</span>
                </>
              )}
            </Button>
          </DialogTrigger>
          <DialogContent className="sm:max-w-[280px] p-4">
            <DialogHeader>
              <DialogTitle className="text-sm">Choose icon</DialogTitle>
              <DialogDescription className="text-xs">
                Click an icon to select it.
              </DialogDescription>
            </DialogHeader>
            <div className="grid grid-cols-5 gap-2 py-2">
              {ICON_PICKER_OPTIONS.map(({ name, Icon }) => (
                <button
                  key={name}
                  type="button"
                  onClick={() => {
                    onChange(name);
                    setOpen(false);
                  }}
                  className={cn(
                    'flex items-center justify-center w-10 h-10 rounded-md border transition-colors',
                    value === name
                      ? 'border-blue-500 bg-blue-500/20 text-blue-400'
                      : 'border-zinc-800 bg-zinc-900/50 hover:bg-zinc-800/50 text-zinc-400 hover:text-zinc-200'
                  )}
                  title={name}
                >
                  <Icon size={20} />
                </button>
              ))}
            </div>
          </DialogContent>
        </Dialog>
      </div>
    );
  },
} as const;

export type WidgetType = keyof typeof InputWidgets;


