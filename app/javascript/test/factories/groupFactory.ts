import { Factory } from "fishery"
import type { Group } from "@/types"

class GroupFactory<T extends Group = Group> extends Factory<T> {}

export const groupFactory = GroupFactory.define(({ sequence }) => ({
  id: sequence,
  name: `Group${sequence}`,
  groupMemberships: [],
}))
