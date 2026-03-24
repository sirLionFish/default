import React from 'react'

interface WordFadeInProps {
  text: string // The dynamic text
  delayBetween?: number // Delay between each word fade-in (default 200ms)
}

const TextFadeIn: React.FC<WordFadeInProps> = ({
  text,
  delayBetween = 200,
}) => {
  // Split the text into words
  const words = text.split(' ')

  return (
    <div className='fade-in-words'>
      {words.map((word, index) => (
        <span
          key={index}
          style={{ animationDelay: `${index * delayBetween}ms` }}
          className='fade-in-word'
        >
          {word}
        </span>
      ))}
    </div>
  )
}

export default TextFadeIn
