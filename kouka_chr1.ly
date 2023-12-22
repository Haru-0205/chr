#(define (tie::tab-clear-tied-fret-numbers grob)
   (let* ((tied-fret-nr (ly:spanner-bound grob RIGHT)))
      (ly:grob-set-property! tied-fret-nr 'transparent #t)))

\version "2.14.0"
\paper {
   indent = #0
   print-all-headers = ##t
   ragged-right = ##f
   ragged-bottom = ##t
}
\layout {
   \context { \Score
      \override MetronomeMark #'padding = #'5
   }
   \context { \Staff
      \override TimeSignature #'style = #'numbered
      \override StringNumber #'transparent = ##t
   }
   \context { \TabStaff
      \override TimeSignature #'style = #'numbered
      \override Stem #'transparent = ##t
      \override Beam #'transparent = ##t
      \override Tie  #'after-line-breaking = #tie::tab-clear-tied-fret-numbers
   }
   \context { \TabVoice
      \override Tie #'stencil = ##f
   }
   \context { \StaffGroup
      \consists "Instrument_name_engraver"
   }
}
TrackAVoiceAMusic = #(define-music-function (parser location inTab) (boolean?)
#{
   \tempo 4=100
   \clef #(if $inTab "tab" "treble_8")
   \key c \major
   \time 4/4
   \oneVoice
   r1 
   r1 
   r1 
    \ottava #1 <e''\1>8. \ottava #0  \ottava #1 <f''\1>16 \ottava #0  \ottava #1 <g''\1>8 \ottava #0  \ottava #1 <a''\1>8 \ottava #0  \ottava #1 <g''\1>2 \ottava #0 
    \ottava #1 <g''\1>8 \ottava #0  \ottava #1 <a''\1>4 \ottava #0  \ottava #1 <g''\1>8 \ottava #0  \ottava #1 <c'''\1>8. \ottava #0  \ottava #1 <c'''\1>16 \ottava #0  \ottava #1 <b''\1>8 \ottava #0  \ottava #1 <a''\1>8 \ottava #0 
    \ottava #1 <g''\1>8. \ottava #0  \ottava #1 <g''\1>16 \ottava #0  \ottava #1 <e''\1>8 \ottava #0  \ottava #1 <e''\1>8 \ottava #0  \ottava #1 <d''\1>2 \ottava #0 
    \ottava #1 <e''\1>8. \ottava #0  \ottava #1 <d''\1>16 \ottava #0 <c''\1>8  \ottava #1 <a''\1>8 \ottava #0  \ottava #1 <g''\1>8 \ottava #0  \ottava #1 <g''\1>8 \ottava #0  \ottava #1 <f''\1>4 \ottava #0 
    \ottava #1 <e''\1>8 \ottava #0  \ottava #1 <e''\1>8 \ottava #0  \ottava #1 <d''\1>8 \ottava #0  \ottava #1 <d''\1>8 \ottava #0 <c''\1>2 
   r1 
   r1 
   r1 
   r1 
    \ottava #1 <e'''\1>4. \ottava #0  \ottava #1 <e'''\1>8 \ottava #0  \ottava #1 <d'''\1>4 \ottava #0  \ottava #1 <c'''\1>4 \ottava #0 
    \ottava #1 <a''\1>4 \ottava #0  \ottava #1 <a''\1>4 \ottava #0  \ottava #1 <g''\1>2 \ottava #0 
    \ottava #1 <a''\1>4 \ottava #0  \ottava #1 <g''\1>4 \ottava #0  \ottava #1 <e''\1>4 \ottava #0  \ottava #1 <g''\1>4 \ottava #0 
    \ottava #1 <d''\1>2. \ottava #0 r4 
   <b'\1>8. <c''\1>16  \ottava #1 <d''\1>8 \ottava #0  \ottava #1 <d''\1>8 \ottava #0  \ottava #1 <e''\1>8 \ottava #0  \ottava #1 <e''\1>8 \ottava #0  \ottava #1 <d''\1>4 \ottava #0 
    \ottava #1 <g''\1>8. \ottava #0  \ottava #1 <c'''\1>16 \ottava #0  \ottava #1 <b''\1>8 \ottava #0  \ottava #1 <a''\1>8 \ottava #0  \ottava #1 <g''\1>4 \ottava #0  \ottava #1 <a''\1>8 \ottava #0  \ottava #1 <a''\1>8 \ottava #0 
    \ottava #1 <d''\1>32 \ottava #0  \ottava #1 <d''\1>8 \ottava #0 r32  \ottava #1 <d''\1>16 \ottava #0  \ottava #1 <g''\1>4 \ottava #0  \ottava #1 <c'''\1>4 \ottava #0 r4 
   \bar "|."
   \pageBreak
#})
TrackAVoiceBMusic = #(define-music-function (parser location inTab) (boolean?)
#{
#})
TrackALyrics = \lyricmode {
   \set ignoreMelismata = ##t
   
   \unset ignoreMelismata
}
TrackAStaff = \new Staff <<
   \context Voice = "TrackAVoiceAMusic" {
      \removeWithTag #'chords
      \TrackAVoiceAMusic ##f
   }
   \context Voice = "TrackAVoiceBMusic" {
      \removeWithTag #'chords
      \TrackAVoiceBMusic ##f
   }
>>
TrackATabStaff = \new TabStaff \with { stringTunings = #`( ,(ly:make-pitch 0 2 NATURAL) ,(ly:make-pitch -1 6 NATURAL) ,(ly:make-pitch -1 4 NATURAL) ,(ly:make-pitch -1 1 NATURAL) ,(ly:make-pitch -2 5 NATURAL) ,(ly:make-pitch -2 2 NATURAL) ) } <<
   \context TabVoice = "TrackAVoiceAMusic" {
      \removeWithTag #'chords
      \removeWithTag #'texts
      \TrackAVoiceAMusic ##t
   }
   \context TabVoice = "TrackAVoiceBMusic" {
      \removeWithTag #'chords
      \removeWithTag #'texts
      \TrackAVoiceBMusic ##t
   }
>>
TrackAStaffGroup = \new StaffGroup <<
   \TrackAStaff
>>
\score {
   \TrackAStaffGroup
   \header {
      title = "" 
      composer = "" 
      instrument = "" 
   }
}
