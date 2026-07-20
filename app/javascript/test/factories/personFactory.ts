import { Factory } from "fishery"
import type { Person } from "@/types"
import { stubTimestamps } from "./timestamps"

class PersonFactory<T extends Person = Person> extends Factory<T> {}

export const personFactory = PersonFactory.define(({ sequence }) => ({
  ...stubTimestamps(),
  id: sequence,
  firstName: `FirstName${sequence}`,
  lastName: `LastName${sequence}`,
  favorite: false,
  birthdayDay: null,
  birthdayMonth: null,
  birthdayYear: null,
  name: `FirstName${sequence} LastName${sequence}`,
  age: null,
  birthday: null,
}))
