import Timeline from '../components/Timeline.tsx'

export function SparklesPreview() {
  return (
    <div className='h-screen relative w-screen flex flex-col items-center justify-center overflow-hidden bg-black'>
      {/* Animated Purple Sunrise Glow */}
      <div className='absolute inset-0 flex items-center justify-center'>
        <div className='w-[66vw] h-[66vw] bg-sunrise-gradient rounded-full animate-sunrise-appear'></div>
      </div>

      {/* Animated Blue Sunrise Glow */}
      <div className='absolute inset-0 flex items-center justify-center'>
        <div className='w-[33vw] h-[33vw] bg-sunrise-gradient-blue rounded-full animate-sunrise-appear-blue'></div>
      </div>

      {/* Text Content */}
      <h1 className='md:text-7xl text-3xl lg:text-6xl font-bold text-center text-white relative z-20'>
        Build great products
      </h1>
      
      <div className='container mt-10 w-2/5 rounded-xl'>
        <section className='bg-brand text-white py-20'>
          <div className='container mx-auto text-center'>
            <h1 className='text-5xl font-bold mb-4'>Profile Summary</h1>
            <p className='text-xl mb-8'>
              Self Motivated Fullstack Functional Paradigm Developer with over 4
              years of professional experience building scalable web
              applications, robust backened systems, and distributed
              architechures. Expertise spans TypeScript, React, Next.js, Phoenix
              LiveView, Elixir, and Postgres. Proven track record of designing
              and emplementing effiecient database schema and delivering
              high-quality, user centric software solutions that drive business
              value.
            </p>
          </div>
        </section>
      </div>
      <Timeline />
    </div>
  )
}
