import { useState } from 'react'
import { CalendarStep } from './CalendarStep'
import { ConfirmStep } from './ConfirmStep'

export function ScheduleForm() {
  const [selectedDateTime, setSelectedDateTime] = useState<Date | null>()

  return !selectedDateTime ? (
    <CalendarStep onSelectDateTime={setSelectedDateTime} />
  ) : (
    <ConfirmStep />
  )
}
