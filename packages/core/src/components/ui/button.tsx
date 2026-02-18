import * as React from 'react';
import { cn } from '../../lib/utils';

interface ButtonProps extends React.ComponentProps<'button'> {
  variant?: 'default' | 'outline' | 'ghost';
  size?: 'sm' | 'default' | 'lg';
  asChild?: boolean;
}

const Button = React.forwardRef<HTMLButtonElement, ButtonProps>(
  ({ className, variant = 'default', size = 'default', asChild, children, ...props }, ref) => {
    const base = 'inline-flex items-center justify-center rounded-md font-medium transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-blue-600 disabled:pointer-events-none disabled:opacity-50';
    const variants = {
      default: 'bg-blue-600 text-white hover:bg-blue-700',
      outline: 'border border-zinc-700 bg-transparent hover:bg-zinc-800',
      ghost: 'hover:bg-zinc-800',
    };
    const sizes = {
      sm: 'h-7 px-2.5 text-xs',
      default: 'h-9 px-4 text-sm',
      lg: 'h-10 px-6 text-base',
    };

    if (asChild && React.isValidElement(children)) {
      const child = children as React.ReactElement<{ className?: string }>;
      const mergedClassName = cn(base, variants[variant], sizes[size], child.props.className, className);
      return React.cloneElement(child, { className: mergedClassName });
    }

    return (
      <button
        ref={ref}
        type="button"
        className={cn(base, variants[variant], sizes[size], className)}
        {...props}
      >
        {children}
      </button>
    );
  }
);

Button.displayName = 'Button';

export { Button };
