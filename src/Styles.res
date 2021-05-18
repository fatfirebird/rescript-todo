open CssJs
open StylesColors

let buttonStyles = buttonType =>
  style(. [
    backgroundColor(
      if buttonType == "delete" {
        colors["red"]["main"]->hex
      } else {
        colors["green"]["main"]->hex
      },
    ),
    padding(20->px),
    cursor(pointer),
    color(white),
    fontSize(16->px),
    borderStyle(none),
    borderRadius(4->px),
    hover([
      backgroundColor(
        if buttonType == "delete" {
          colors["red"]["dark"]->hex
        } else {
          colors["green"]["dark"]->hex
        },
      ),
      transitionDuration(300),
    ]),
  ])

let todoContainerStyles = () => style(. [display(#flex), alignItems(center)])
let todoTextStyles = () => style(. [marginRight(20->px)])
