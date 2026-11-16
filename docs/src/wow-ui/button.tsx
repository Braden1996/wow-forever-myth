// Forked from warcraftcn/ui (https://github.com/TheOrcDev/warcraftcn-ui, MIT, see ./LICENSE.md) at 67dfa8e.
// Changes: strict-TypeScript props, relative imports; styles come from ./warcraft.css via the global stylesheet.

import type { VariantProps } from "class-variance-authority";
import type { ComponentProps, ReactElement } from "react";
import { Slot } from "@radix-ui/react-slot";
import { cva } from "class-variance-authority";

import { cn } from "./cn.ts";

export const buttonVariants = cva(
  "fantasy inline-flex shrink-0 items-center justify-center gap-2 whitespace-nowrap rounded-md font-medium text-sm outline-none transition-all duration-100 focus-visible:border-ring focus-visible:ring-[3px] focus-visible:ring-ring/50 disabled:pointer-events-none disabled:opacity-50 [&_svg:not([class*='size-'])]:size-4 [&_svg]:pointer-events-none [&_svg]:shrink-0 active:scale-95 active:brightness-75 active:shadow-inner",
  {
    variants: {
      variant: {
        default: "bg-center px-5 py-4 bg-cover bg-no-repeat text-white hover:brightness-110",
        frame: "bg-center bg-cover bg-no-repeat text-white hover:brightness-110",
      },
    },
    defaultVariants: {
      variant: "default",
    },
  },
);

export interface ButtonProps extends ComponentProps<"button">, VariantProps<typeof buttonVariants> {
  readonly asChild?: boolean;
}

export const Button = ({ className, variant, asChild = false, ...props }: ButtonProps): ReactElement => {
  const Comp = asChild ? Slot : "button";
  const borderImageClass = variant === "frame" ? "wc-btn-border-frame" : "wc-btn-border";
  return (
    <Comp
      className={cn(
        buttonVariants({ variant }),
        "border-solid [border-image-repeat:stretch] border-5 [border-image-slice:16_fill]",
        borderImageClass,
        className,
      )}
      data-slot="button"
      {...props}
    />
  );
};
