export function getWeekDays() {
  const formatter = new Intl.DateTimeFormat('pt-BR', { weekday: 'long' })

  return Array.from({ length: 7 })
    .map((_, day) => formatter.format(new Date(Date.UTC(2021, 5, day))))
    .map((weekday) =>
      weekday.substring(0, 1).toUpperCase().concat(weekday.substring(1)),
    )
}
