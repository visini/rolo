import { Factory } from "fishery"
import type { User } from "@/types"
import { stubTimestamps } from "./timestamps"

class UserFactory<T extends User = User> extends Factory<T> {}

export const userFactory = UserFactory.define(({ sequence }) => ({
  ...stubTimestamps(),
  id: sequence,
  emailAddress: `user${sequence}@example.com`,
}))
