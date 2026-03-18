import * as React from "react"
import { Slot } from "radix-ui"
import { cn } from "@/lib/utils"

export type ButtonVariant = "default" | "outline" | "ghost" | "secondary"
export type ButtonSize = "default" | "sm" | "lg" | "icon"

const variantClasses: Record<ButtonVariant, string> = {
  default:
    "bg-primary text-primary-foreground shadow hover:brightness-110 active:scale-[0.98]",
  outline:
    "border border-border bg-transparent text-muted-foreground hover:bg-muted hover:text-foreground",
  ghost:
    "bg-transparent text-muted-foreground hover:bg-muted hover:text-foreground",
  secondary:
    "bg-secondary text-secondary-foreground hover:bg-secondary/80",
}

const sizeClasses: Record<ButtonSize, string> = {
  default: "h-10 px-5 py-2.5 text-sm",
  sm: "h-8 px-3 py-1.5 text-xs rounded-md",
  lg: "h-11 px-7 py-3 text-base",
  icon: "h-9 w-9",
}

export interface ButtonProps
  extends React.ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: ButtonVariant
  size?: ButtonSize
  asChild?: boolean
}

const Button = React.forwardRef<HTMLButtonElement, ButtonProps>(
  (
    {
      className,
      variant = "default",
      size = "default",
      asChild = false,
      ...props
    },
    ref
  ) => {
    const Comp = asChild ? Slot.Root : "button"
    return (
      <Comp
        data-slot="button"
        ref={ref}
        className={cn(
          "inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-lg font-semibold transition-all duration-200",
          "focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-primary/50",
          "disabled:pointer-events-none disabled:opacity-50",
          "[&_svg]:pointer-events-none [&_svg]:shrink-0",
          variantClasses[variant ?? "default"],
          sizeClasses[size ?? "default"],
          className
        )}
        {...props}
      />
    )
  }
)
Button.displayName = "Button"

export { Button }
