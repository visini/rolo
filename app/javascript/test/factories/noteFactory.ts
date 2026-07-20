import { Factory } from "fishery"
import type { Note } from "@/types"
import { STUB_TIMESTAMP } from "./timestamps"

class NoteFactory<T extends Note = Note> extends Factory<T> {}

export const noteFactory = NoteFactory.define(({ sequence }) => ({
  id: sequence,
  title: `Title${sequence}`,
  body: `Body${sequence}`,
  createdAt: STUB_TIMESTAMP,
}))
