import { useState } from 'react'
import { CalendarStep } from './CalendarStep'
import { ConfirmStep } from './ConfirmStep'

export function ScheduleForm() {
  const [selectedDateTime, setSelectedDateTime] = useState<Date | null>()

  function handleClearSelectedDateTime() {
    setSelectedDateTime(null)
  }
  return !selectedDateTime ? (
    <CalendarStep onSelectDateTime={setSelectedDateTime} />
  ) : (
    <ConfirmStep
      onCancelOrConfirmation={handleClearSelectedDateTime}
      schedulingDate={selectedDateTime}
    />
  )
}
