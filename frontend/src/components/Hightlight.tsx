import React from 'react'

const HeroHighlight = ({ title, subtitle, highlightColor = '#ff6b6b' }) => {
  return (
    <div
      style={{
        position: 'relative',
        display: 'flex',
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'center',
        height: '100vh',
        background: 'linear-gradient(135deg, #1e1e2f, #2a2a40)',
        overflow: 'hidden',
      }}
    >
      {/* Background Animation */}
      <div
        style={{
          position: 'absolute',
          top: '-50%',
          left: '-50%',
          width: '200%',
          height: '200%',
          background:
            'radial-gradient(circle, rgba(255, 255, 255, 0.1) 10%, transparent 10.01%)',
          backgroundSize: '20px 20px',
          animation: 'moveBackground 10s linear infinite',
          zIndex: 1,
        }}
      />

      {/* Title with Highlight */}
      <h1
        style={{
          position: 'relative',
          fontSize: '4rem',
          fontWeight: 'bold',
          color: 'white',
          zIndex: 2,
        }}
      >
        <span
          style={{
            background: `linear-gradient(90deg, ${highlightColor}, #ff9f43)`,
            backgroundClip: 'text',
            WebkitBackgroundClip: 'text',
            color: 'transparent',
          }}
        >
          {title}
        </span>
      </h1>

      {/* Subtitle */}
      {subtitle && (
        <p
          style={{
            fontSize: '1.5rem',
            color: 'rgba(255, 255, 255, 0.8)',
            marginTop: '1rem',
            zIndex: 2,
          }}
        >
          {subtitle}
        </p>
      )}

      {/* CSS Animation */}
      <style>
        {`
          @keyframes moveBackground {
            0% {
              transform: translate(0, 0);
            }
            100% {
              transform: translate(50%, 50%);
            }
          }
        `}
      </style>
    </div>
  )
}

export default HeroHighlight
