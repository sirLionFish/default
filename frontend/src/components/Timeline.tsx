import React, { useEffect, useRef, useState } from 'react'

interface TimelineEvent {
  date: string
  title: string
  description: string
}

const events: TimelineEvent[] = [
  {
    date: 'March 2020 - June 2024',
    title: 'International Money Transfer',
    description: 'Began my journey as a Fullstack Developer.',
  },
  {
    date: 'January 2020 - March 2020',
    title: 'E-Commerce PIM & Digital Asset Engineer',
    description: 'Took on more leadership responsibilities.',
  },
  {
    date: 'August 2018 - August 2019',
    title: 'Data Security ops & Incident report',
    description: 'Led a team to develop a scalable web application.',
  },
  {
    date: 'March 2017 - July 2018',
    title: 'Distributed System Engineer',
    description: 'Led a team to develop a scalable web application.',
  },
]

const Timeline: React.FC = () => {
  const [activeIndex, setActiveIndex] = useState<number>(-1)
  const timelineRef = useRef<HTMLDivElement>(null)

  useEffect(() => {
    const handleScroll = () => {
      if (!timelineRef.current) return
      const timelineTop = timelineRef.current.getBoundingClientRect().top
      const timelineHeight = timelineRef.current.offsetHeight
      const windowHeight = window.innerHeight

      const scrollPosition = window.scrollY

      const newActiveIndex = events.findIndex((event, index) => {
        const eventPosition = timelineTop + window.scrollY + index * 100 // Adjust spacing as needed
        return scrollPosition >= eventPosition - windowHeight / 2
      })

      setActiveIndex(newActiveIndex)
    }

    window.addEventListener('scroll', handleScroll)
    handleScroll() // Initial check

    return () => {
      window.removeEventListener('scroll', handleScroll)
    }
  }, [])

  return (
    <div className='relative'>
      {/* Sticky Header */}
      <div className='sticky top-0 bg-white shadow-md z-10'>
        <h2 className='text-3xl font-bold text-center py-4'>
          Professional Experiences
        </h2>
      </div>

      {/* Timeline Container */}
      <div ref={timelineRef} className='mt-8 flex'>
        {/* Scroll Beam */}
        <div className='w-1 bg-gray-300 relative'>
          <div
            className='absolute top-0 w-full bg-blue-500'
            style={{
              height:
                activeIndex >= 0
                  ? `${(activeIndex + 1) * (100 / events.length)}%`
                  : '0%',
              transition: 'height 0.3s ease-out',
            }}
          ></div>
        </div>

        {/* Timeline Events */}
        <div className='ml-4 w-full'>
          {events.map((event, index) => (
            <div key={index} className='mb-8 flex'>
              <div className='flex-shrink-0'>
                <div
                  className={`w-4 h-4 rounded-full ${
                    index <= activeIndex ? 'bg-blue-500' : 'bg-gray-300'
                  }`}
                ></div>
              </div>
              <div className='ml-4'>
                <h3 className='text-xl font-semibold text-ellipsis text-white'>{event.title}</h3>
                <span className='text-gray-500'>{event.date}</span>
                <p className='mt-2 text-gray-700'>{event.description}</p>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  )
}

export default Timeline
