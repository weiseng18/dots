import NUSModerator from 'nusmoderator'

/**
 * This function is taken from my scriptable repo
 */
function NUSDate() {
  const calendar = NUSModerator.academicCalendar

  // get relevant info
  const dateInfo = calendar.getAcadWeekInfo(new Date())

  // sem info
  let sem = dateInfo.sem
  sem = sem.replace(/Special Term/, 'ST')
  sem = sem.replace(/Semester/, 'Sem')

  // week info
  const weekNumber = dateInfo.num
  const weekInfo = calendar.getAcadWeekName(weekNumber)
  let weekString
  if (weekInfo.weekType == 'Instructional') {
    weekString = `Week ${weekNumber}`
  } else {
    weekString = `${weekType} Week`
  }

  // year, sem, week
  return {
    year: `AY ${dateInfo.year}`,
    sem,
    week: weekString,
  }
}

const data = NUSDate()
const result = `${data.year} ${data.sem} ${data.week}`
console.log(result)
