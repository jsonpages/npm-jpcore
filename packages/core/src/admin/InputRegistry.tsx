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
  Layers,
  Github,
  ArrowRight,
  Box,
  Terminal,
  ChevronRight,
  Menu,
  X,
} from 'lucide-react';
import { BaseWidgetProps } from '../lib/shared-types';

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

  'ui:icon-picker': ({ label, value, onChange }: BaseWidgetProps<string>) => {
    const availableIcons = [
      { name: 'layers', icon: Layers },
      { name: 'github', icon: Github },
      { name: 'arrow-right', icon: ArrowRight },
      { name: 'box', icon: Box },
      { name: 'terminal', icon: Terminal },
      { name: 'chevron-right', icon: ChevronRight },
      { name: 'menu', icon: Menu },
      { name: 'x', icon: X },
    ];

    return (
      <div className="grid w-full gap-1.5 mb-4">
        <Label className="text-[9px] uppercase font-black tracking-widest text-zinc-500">
          {label}
        </Label>
        <Select value={value || ""} onValueChange={onChange}>
          <SelectTrigger className="w-full h-7 text-[11px] bg-zinc-900/50 border-zinc-800 focus:ring-blue-600">
            <SelectValue placeholder="Icon..." />
          </SelectTrigger>
          <SelectContent className="dark">
            {availableIcons.map((item) => (
              <SelectItem key={item.name} value={item.name} className="text-[11px]">
                <div className="flex items-center gap-2">
                  <item.icon size={12} className="text-zinc-500" />
                  <span className="capitalize">{item.name}</span>
                </div>
              </SelectItem>
            ))}
          </SelectContent>
        </Select>
      </div>
    );
  },
} as const;

export type WidgetType = keyof typeof InputWidgets;


