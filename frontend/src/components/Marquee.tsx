import React from 'react'

const Highlight8 = () => {
  return (
    <div className='2xl:container 2xl:mx-auto md:py-12 py-9'>
      <div className='overflow-hidden bg-gray-800'>
        <marquee behavior='scroll' direction='right' scrollamount='20'>
          <div className='lg:py-8 lg:px-20 md:p-6 py-6 px-4 flex lg:space-x-20 space-x-12'>
            <p className='flex-none text-base leading-4 font-normal text-white'>
              Worldwide Delivery
            </p>
            <p className='flex-none text-base leading-4 font-normal text-white'>
              Cruelty Free
            </p>
            <p className='flex-none text-base leading-4 font-normal text-white'>
              Drug Free
            </p>
            <p className='flex-none text-base leading-4 font-normal text-white'>
              Recycleable
            </p>
            <p className='flex-none text-base leading-4 font-normal text-white'>
              money-Back Guarantee
            </p>
            <p className='flex-none text-base leading-4 font-normal text-white'>
              No side Effects
            </p>
          </div>
        </marquee>
      </div>
    </div>
  )
}

export default Highlight8
