// Forked from warcraftcn/ui (https://github.com/TheOrcDev/warcraftcn-ui, MIT, see ./LICENSE.md) at 67dfa8e.
// Changes: no faction variant (this site names no game factions), renders a span, strict-TypeScript props.

import type { VariantProps } from "class-variance-authority";
import type { ComponentProps, ReactElement } from "react";
import { cva } from "class-variance-authority";

import { cn } from "./cn.ts";

export const badgeVariants = cva(
  "fantasy inline-flex items-center gap-1.5 transition-all duration-100 [border-image-repeat:stretch] border-solid",
  {
    variants: {
      variant: {
        default:
          "text-amber-100 [text-shadow:0_0_8px_rgba(251,191,36,0.4)] wc-btn-border-frame [border-image-slice:16_fill]",
        secondary: "text-slate-200 wc-btn-border [border-image-slice:16_fill]",
        destructive:
          "text-red-200 [text-shadow:0_0_8px_rgba(239,68,68,0.4)] wc-btn-border-frame brightness-75 hue-rotate-[320deg] [border-image-slice:16_fill]",
        outline: "border-amber-900/50 bg-black/40 text-amber-200/80",
      },
      size: {
        default: "px-3 py-1 text-xs border-[3px]",
        sm: "px-2 py-0.5 text-[10px] border-[2px]",
        lg: "px-4 py-1.5 text-sm border-[4px]",
      },
      shape: {
        default: "rounded-md",
        shield: "rounded-t-sm rounded-b-xl border-b-[5px]",
        banner: "rounded-none clip-path-banner",
      },
    },
    defaultVariants: {
      variant: "default",
      size: "default",
      shape: "default",
    },
  },
);

export interface BadgeProps extends ComponentProps<"span">, VariantProps<typeof badgeVariants> {}

export const Badge = ({ className, variant, size, shape, ...props }: BadgeProps): ReactElement => (
  <span className={cn(badgeVariants({ variant, size, shape }), className)} {...props} />
);
