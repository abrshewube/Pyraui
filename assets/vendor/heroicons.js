const plugin = require("tailwindcss/plugin")
const fs = require("fs")
const path = require("path")

module.exports = plugin(function({matchComponents, theme}) {
  let iconsDir = path.join(__dirname, "../../assets/icons")
  let values = {}
  let variants = [
    ["", "outline"],
    ["-solid", "solid"],
    ["-mini", "mini"],
    ["-micro", "micro"]
  ]
  variants.forEach(([suffix, dir]) => {
    let dirPath = path.join(iconsDir, dir)
    if (!fs.existsSync(dirPath)) {
      return
    }
    fs.readdirSync(dirPath).forEach(file => {
      if (path.extname(file) !== ".svg") return
      let name = path.basename(file, ".svg") + suffix
      values[name] = {name, fullPath: path.join(dirPath, file)}
    })
  })
  matchComponents({
    "hero": ({name, fullPath}) => {
      let content = fs.readFileSync(fullPath).toString().replace(/\r?\n|\r/g, "")
      content = encodeURIComponent(content)
      let size = theme("spacing.6")
      if (name.endsWith("-mini")) {
        size = theme("spacing.5")
      } else if (name.endsWith("-micro")) {
        size = theme("spacing.4")
      }
      return {
        [`--hero-${name}`]: `url('data:image/svg+xml;utf8,${content}')`,
        "-webkit-mask": `var(--hero-${name})`,
        "mask": `var(--hero-${name})`,
        "mask-repeat": "no-repeat",
        "background-color": "currentColor",
        "vertical-align": "middle",
        "display": "inline-block",
        "width": size,
        "height": size
      }
    }
  }, {values})
})
