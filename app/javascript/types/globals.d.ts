import type { FlashData, SharedProps } from "@/types"

declare module "vite/client" {
  interface ImportMetaEnv {
    readonly VITE_APP_NAME: string
    [key: string]: string | boolean | undefined
  }
}

declare module "@inertiajs/core" {
  export interface InertiaConfig {
    sharedPageProps: SharedProps
    flashDataType: FlashData
    errorValueType: string[]
  }
}
