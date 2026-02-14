import * as React from 'react';
import { cn } from '../../lib/utils';

type SelectContextValue = {
  value: string;
  onValueChange: (v: string) => void;
  options: Array<{ value: string; label: React.ReactNode }>;
  placeholder?: string;
};

const SelectContext = React.createContext<SelectContextValue | null>(null);

function useSelectContext() {
  const ctx = React.useContext(SelectContext);
  if (!ctx) throw new Error('Select components must be used within Select');
  return ctx;
}

function Select({
  value,
  onValueChange,
  children,
}: {
  value?: string;
  onValueChange?: (v: string) => void;
  children: React.ReactNode;
}) {
  const resolvedValue = value ?? '';

  type ContentElement = React.ReactElement<{ children?: React.ReactNode }>;
  type TriggerElement = React.ReactElement<{ children?: React.ReactNode }>;

  const content = React.Children.toArray(children).find(
    (c): c is ContentElement => React.isValidElement(c) && (c.type as unknown) === SelectContent
  );
  const trigger = React.Children.toArray(children).find(
    (c): c is TriggerElement => React.isValidElement(c) && (c.type as unknown) === SelectTrigger
  );

  const contentChildren = content && React.isValidElement(content) ? content.props.children : undefined;
  const triggerChildren = trigger && React.isValidElement(trigger) ? trigger.props.children : undefined;

  const options = React.useMemo(() => {
    if (!content || !React.isValidElement(content)) return [];
    return React.Children.toArray(content.props.children)
      .filter((child): child is React.ReactElement<{ value: string; children?: React.ReactNode }> => React.isValidElement(child) && (child.props as { value?: string }).value !== undefined)
      .map((child) => ({ value: (child.props as { value: string; children?: React.ReactNode }).value, label: (child.props as { value: string; children?: React.ReactNode }).children ?? (child.props as { value: string }).value }));
  }, [content, contentChildren]);

  const placeholder = React.useMemo(() => {
    if (!trigger || !React.isValidElement(trigger)) return '';
    const valueChild = React.Children.toArray(trigger.props.children).find(
      (c): c is React.ReactElement<{ placeholder?: string }> => React.isValidElement(c) && (c.type as unknown) === SelectValue
    );
    return valueChild && React.isValidElement(valueChild) ? (valueChild.props as { placeholder?: string }).placeholder ?? '' : '';
  }, [trigger, triggerChildren]);

  const contextValue = React.useMemo<SelectContextValue>(
    () => ({
      value: resolvedValue,
      onValueChange: (v: string) => onValueChange?.(v),
      options,
      placeholder,
    }),
    [resolvedValue, onValueChange, options, placeholder]
  );

  return (
    <SelectContext.Provider value={contextValue}>
      {trigger}
    </SelectContext.Provider>
  );
}

function SelectTrigger({ className, children, ...props }: React.ComponentProps<'div'>) {
  const { value, onValueChange, options, placeholder } = useSelectContext();
  return (
    <div className={cn('relative', className)} {...props}>
      <select
        value={value}
        onChange={(e) => onValueChange(e.target.value)}
        className="w-full h-7 rounded border border-zinc-800 bg-zinc-900/50 text-[11px] text-left px-2 pr-6 appearance-none bg-no-repeat bg-[length:12px] bg-[right_0.25rem_center] focus:ring-2 focus:ring-blue-600 focus:outline-none"
        style={{
          backgroundImage: "url(\"data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 24 24' fill='none' stroke='%23717171' stroke-width='2'%3E%3Cpath d='M6 9l6 6 6-6'/%3E%3C/svg%3E\")",
        }}
      >
        {placeholder ? <option value="">{placeholder}</option> : null}
        {options.map((o) => (
          <option key={o.value} value={o.value}>
            {String(o.label)}
          </option>
        ))}
      </select>
      {children}
    </div>
  );
}

function SelectValue(_props: { placeholder?: string }) {
  return null;
}

function SelectContent({ className, children }: React.ComponentProps<'div'>) {
  return <div className={cn('hidden', className)} aria-hidden>{children}</div>;
}

function SelectItem({ className, value, children }: React.ComponentProps<'div'> & { value: string }) {
  return <div data-value={value} className={className} aria-hidden>{children}</div>;
}

SelectTrigger.displayName = 'SelectTrigger';
SelectValue.displayName = 'SelectValue';
SelectContent.displayName = 'SelectContent';
SelectItem.displayName = 'SelectItem';

export { Select, SelectTrigger, SelectValue, SelectContent, SelectItem };
