# Claude Ghostty themes

Claude Light and Claude Dark adapt the claude-design-system skill to Ghostty, with warm canvas colors, clay accents, and a muted ANSI palette.

The Ghostty configuration selects both themes automatically:

```ini
theme = light:Claude Light,dark:Claude Dark
```

Reload Ghostty with `Cmd+Shift+,`. The theme follows the system appearance, as described in the [Ghostty theme documentation](https://ghostty.org/docs/features/theme).

To use one appearance permanently, replace that line with `theme = Claude Light` or `theme = Claude Dark`.

## Palette

| Role | Light | Dark |
| --- | --- | --- |
| Canvas, CDS surface 1 | `#fcfcfb` | `#151515` |
| Text, CDS warm gray | `#373634` | `#dedcd6` |
| Cursor and focused search | `#d97757` | `#d97757` |
| Text inside cursor | `#0b0b0a` | `#0b0b0a` |
| Selection, clay at 30% over canvas | `#f2d4ca` | `#503229` |
| Split divider | `#dedcd6` | `#373634` |

The [CDS source snapshot](https://claude-storybook.bystanderss.chatgpt.site/) dates from 2026-10-17. It is a third-party interpretation, unverified against Claude.app.

CDS does not define an ANSI palette. These themes add muted red, green, ochre, slate, mauve, and teal for terminal semantics.
These companion colors are terminal adaptations, not source tokens.
Light ANSI red uses deeper clay because the original clay fails the 4.5:1 contrast target on the light canvas.
Dark ANSI black uses CDS surface 0 for background fills. It is not intended for text against the dark canvas.

The themes set colors only. Existing fonts, background opacity, blur, shaders, and color space settings still apply.
For exact CDS colors, use an opaque background and the sRGB color space. Transparency blends the canvas with the desktop.
The current configuration uses 0.88 opacity and Display P3. Contrast measurements assume opaque sRGB colors.
Applications that set their own colors, such as editor themes and truecolor prompts, can override this palette.
