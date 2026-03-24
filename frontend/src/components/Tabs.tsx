
'use client' // For Next.js components

import { useState } from 'react'
import { motion, AnimatePresence } from 'framer-motion'

interface Tab {
  title: string
  value: string
  content: React.ReactNode
}

export const Tabs = ({ tabs }: { tabs: Tab[] }) => {
  const [activeTab, setActiveTab] = useState<string>(tabs[0].value)

  return (
    <>
      {/* Tab Titles */}
      <div className='flex flex-row items-center justify-start'>
        {tabs.map((tab) => (
          <button
            key={tab.value}
            onClick={() => setActiveTab(tab.value)}
            className={`relative px-4 py-2 rounded-full ${
              activeTab === tab.value ? 'active' : ''
            }`} // Basic active styling
          >
            {activeTab === tab.value && (
              <motion.div
                layoutId='activeTabBackground'
                transition={{ type: 'spring', bounce: 0.3, duration: 0.6 }}
                className='absolute inset-0 bg-gradient-to-r from-indigo-500 to-pink-500 rounded-full' // Gradient background
              />
            )}
            <span>{tab.title}</span>
          </button>
        ))}
      </div>

      {/* Tab Content */}
      <AnimatePresence initial={false} mode='wait'>
        <motion.div
          key={activeTab}
          variants={{
            enter: { opacity: 1, x: 0 },
            exit: { opacity: 0, x: -100 },
          }}
          initial='exit'
          animate='enter'
          exit='exit'
          transition={{ type: 'spring', duration: 0.4 }}
          className='mt-4'
        >
          {tabs.find((tab) => tab.value === activeTab)?.content}
        </motion.div>
      </AnimatePresence>
    </>
  )
}