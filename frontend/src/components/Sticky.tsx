import React from 'react'

interface TimelineEvent {
  date: string
  title: string
  description: string
}

const events: TimelineEvent[] = [
  {
    date: 'March 2020 - June 2024',
    title: 'Funny man',
    description: 'Description for Funny man.',
  },
  {
    date: 'January 2020 - March 2020',
    title: 'Join',
    description: 'Description for Join.',
  },
  {
    date: 'August 2018 - August 2019',
    title: 'Date night',
    description: 'Description for Date night.',
  },
  {
    date: 'March 2017 - July 2018',
    title: 'Distributed beer',
    description: 'Description for Distributed beer.',
  },
]

const Timeline: React.FC = () => {
  return (
    <div
      className='timeline-container'
      style={{
        height: '100vh',
        overflowY: 'scroll',
        scrollSnapType: 'y mandatory',
        fontFamily: 'sans-serif',
      }}
    >
      {events.map((event, index) => (
        <div
          key={index}
          style={{
            height: '100vh',
            scrollSnapAlign: 'start',
            display: 'flex',
            padding: '2rem',
            backgroundColor: 'transparent',
          }}
        >
          {/* Left Column: Text Event */}
          <div style={{ flex: 1, paddingRight: '1rem', textAlign: 'left' }}>
            <h2 className='text-xl font-semibold text-ellipsis text-white'>
              {event.title}
            </h2>
            <p
              style={{
                fontSize: '1.25rem',
                color: '#666',
                marginBottom: '0.5rem',
              }}
            >
              {event.date}
            </p>
            <p style={{ fontSize: '1rem', color: '#333' }}>
              {event.description}
            </p>
          </div>
          {/* Right Column: Card with the same content */}
          <div
            style={{
              flex: 1,
              paddingLeft: '1rem',
              display: 'flex',
              alignItems: 'flex-start',
              justifyContent: 'flex-start',
            }}
          >
            <div
              style={{
                backgroundColor: '#fff',
                borderRadius: '8px',
                boxShadow: '0 4px 8px rgba(0,0,0,0.1)',
                padding: '1.5rem',
                width: '90%',
              }}
            >
              <h2 style={{ fontSize: '2.5rem', marginBottom: '1rem' }}>
                {event.title}
              </h2>
              <p
                style={{
                  fontSize: '1.25rem',
                  color: '#666',
                  marginBottom: '0.5rem',
                }}
              >
                {event.date}
              </p>
              <p style={{ fontSize: '1rem', color: '#333' }}>
                {event.description}
              </p>
            </div>
          </div>
        </div>
      ))}

      {/* CSS to hide scrollbar for WebKit browsers */}
      <style >{`
        .timeline-container::-webkit-scrollbar {
          display: none;
        }
      `}</style>
    </div>
  )
}

export default Timeline
