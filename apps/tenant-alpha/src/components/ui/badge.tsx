import * as React from "react"
import { cn } from "@/lib/utils"

export type BadgeVariant = "default" | "secondary" | "outline" | "brand"

const variantClasses: Record<BadgeVariant, string> = {
  default:
    "bg-primary/10 border border-primary/30 text-primary",
  secondary:
    "bg-muted border border-border text-muted-foreground",
  outline:
    "bg-transparent border border-border text-muted-foreground",
  brand:
    "bg-primary/10 border border-primary/30 text-primary font-mono",
}

export interface BadgeProps extends React.HTMLAttributes<HTMLSpanElement> {
  variant?: BadgeVariant
}

function Badge({ className, variant = "default", ...props }: BadgeProps) {
  return (
    <span
      data-slot="badge"
      className={cn(
        "inline-flex items-center gap-1.5 rounded-full px-3 py-1 text-xs font-medium",
        variantClasses[variant ?? "default"],
        className
      )}
      {...props}
    />
  )
}

export { Badge }
