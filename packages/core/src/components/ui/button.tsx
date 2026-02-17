import * as React from 'react';
import { cn } from '../../lib/utils';

interface ButtonProps extends React.ComponentProps<'button'> {
  variant?: 'default' | 'outline' | 'ghost';
  asChild?: boolean;
}

const Button = React.forwardRef<HTMLButtonElement, ButtonProps>(
  ({ className, variant = 'default', asChild, children, ...props }, ref) => {
    const base = 'inline-flex items-center justify-center rounded-md text-sm font-medium transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-blue-600 disabled:pointer-events-none disabled:opacity-50';
    const variants = {
      default: 'bg-blue-600 text-white hover:bg-blue-700',
      outline: 'border border-zinc-700 bg-transparent hover:bg-zinc-800',
      ghost: 'hover:bg-zinc-800',
    };

    if (asChild && React.isValidElement(children)) {
      return React.cloneElement(children as React.ReactElement<{ className?: string; ref?: React.Ref<unknown> }>, {
        className: cn(base, variants[variant], (children as React.ReactElement).props?.className, className),
        ref,
      });
    }

    return (
      <button
        ref={ref}
        type="button"
        className={cn(base, variants[variant], className)}
        {...props}
      >
        {children}
      </button>
    );
  }
);

Button.displayName = 'Button';

export { Button };
