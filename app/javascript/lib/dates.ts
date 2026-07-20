const swissDateTime = new Intl.DateTimeFormat("de-CH", {
  day: "2-digit",
  month: "2-digit",
  year: "numeric",
  hour: "2-digit",
  minute: "2-digit",
  hour12: false,
})

export const formatDate = (value: string) => {
  const [year, month, day] = value.split("-")
  return `${day}.${month}.${year}`
}

export const formatDateTime = (value: string) => {
  const parts = swissDateTime.formatToParts(new Date(value)).reduce(
    (formatted, part) => {
      if (part.type !== "literal") formatted[part.type] = part.value
      return formatted
    },
    {} as Record<Intl.DateTimeFormatPartTypes, string>,
  )

  return `${parts.day}.${parts.month}.${parts.year} ${parts.hour}:${parts.minute}`
}
