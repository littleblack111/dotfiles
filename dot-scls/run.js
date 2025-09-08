/*

写 Rust 真的是浪费生命!!!

*/
const { homedir } = require('os')
const { join, parse } = require('path')
const { execSync } = require('child_process')
const fs = require('fs')

const rootDir = join(homedir(), '.scls')
const cfgFile = join(rootDir, 'external-snippets.toml')
const externalSnippets = join(rootDir, 'external-snippets')

function clone(url, destination) {
  const cmd = `git clone ${url} ${destination}`
  console.log(cmd)
  execSync(cmd, { cwd: externalSnippets })
}

function mkdirp(path) {
  if (fs.existsSync(path)) {
    return
  }
  mkdirp(join(path, '..'))
  fs.mkdirSync(path)
}

function isDir(path) {
  return fs.existsSync(path) && fs.lstatSync(path).isDirectory()
}

function realName(filename) {
  return parse(filename).name
}

/**
 * 生成配置文件
 * @param {string} file 
 * @param {string} workspace
 */
function createConfigFile(file, workspace) {
  let content = `[[sources]]
name = "friendly-snippets"
git = "https://github.com/rafamadriz/friendly-snippets.git"
`

  function addSnippet(lang, path) {
return `
[[sources.paths]]
scope = ["${lang}"]
path = "snippets/${path}"
`
  }

  const frameworks = 'frameworks'

  function append(workspace, always = false) {
    fs.readdirSync(workspace).forEach(filename=> {
      if (filename.startsWith('.') || (filename == frameworks && !always)) return
      let name = realName(filename)
      const filepath = join(workspace, filename)
      if (!isDir(filepath)) {
        if (always) {
          filename = join(frameworks, filename)
        }
        content += addSnippet(name, filename)
      } else {
        fs.readdirSync(filepath).forEach(subname=> {
          let filepath = join(filename, subname)
          if (always) {
            filepath = join(frameworks, filepath)
          }
          content += addSnippet(filename, filepath) 
        })
      }
    })
  }

  append(workspace)
  append(join(workspace, frameworks), true)

  fs.writeFileSync(file, content)
}


function main() {
  mkdirp(externalSnippets)
  const name = 'friendly-snippets'
  const workspace = join(externalSnippets, name)
  if (!fs.existsSync(workspace)) {
    clone('https://github.com/rafamadriz/friendly-snippets', name)
    if (!fs.existsSync(workspace)) {
      throw new Error('Failed to clone external snippets')
    }
  }
  if (fs.existsSync(cfgFile)) return
  createConfigFile(cfgFile, join(workspace, 'snippets'))
}

main()