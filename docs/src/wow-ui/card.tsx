// Forked from warcraftcn/ui (https://github.com/TheOrcDev/warcraftcn-ui, MIT, see ./LICENSE.md) at 67dfa8e.
// Changes: strict-TypeScript props, relative imports, smaller header padding; styles come from ./warcraft.css.

import type { ComponentProps, ReactElement } from "react";

import { cn } from "./cn.ts";

export const Card = ({ className, ...props }: ComponentProps<"div">): ReactElement => (
  <div
    data-slot="card"
    className={cn(
      "fantasy text-card-foreground gap-4 overflow-hidden rounded-xl text-sm has-data-[slot=card-footer]:pb-0 data-[size=sm]:gap-3 group/card flex flex-col border-solid wc-card-border [border-image-repeat:stretch]",
      "border-24 px-6 [border-image-slice:24_fill]",
      "data-[size=sm]:border-16 data-[size=sm]:p-4 data-[size=sm]:py-3 data-[size=sm]:[border-image-slice:16_fill]",
      className,
    )}
    {...props}
  />
);

export const CardHeader = ({ className, ...props }: ComponentProps<"div">): ReactElement => (
  <div
    data-slot="card-header"
    className={cn(
      "gap-1 pt-4 rounded-t-xl px-4 group-data-[size=sm]/card:px-3 grid auto-rows-min items-start",
      className,
    )}
    {...props}
  />
);

export const CardTitle = ({ className, ...props }: ComponentProps<"div">): ReactElement => (
  <div
    data-slot="card-title"
    className={cn("text-base leading-snug font-medium group-data-[size=sm]/card:text-sm", className)}
    {...props}
  />
);

export const CardDescription = ({ className, ...props }: ComponentProps<"div">): ReactElement => (
  <div data-slot="card-description" className={cn("text-muted-foreground text-sm", className)} {...props} />
);

export const CardContent = ({ className, ...props }: ComponentProps<"div">): ReactElement => (
  <div data-slot="card-content" className={cn("px-4 group-data-[size=sm]/card:px-3", className)} {...props} />
);

export const CardFooter = ({ className, ...props }: ComponentProps<"div">): ReactElement => (
  <div
    data-slot="card-footer"
    className={cn("rounded-b-xl p-4 group-data-[size=sm]/card:p-3 flex items-center", className)}
    {...props}
  />
);
