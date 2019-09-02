# hubot-command-chaining

hubot-command-chaining allows hubot commands to be chained together via anding and piping, a la a unix command line.

For example, given that `echo` responds with your input, and [`pug bomb N`](https://github.com/hubot-scripts/hubot-pugme) responds with N pictures of pugs, 
* `hubot echo check out this pug && hubot pug me` will respond with "check out this pug" and a picture of a pug.
* `hubot echo 10 |xargs hubot pug bomb $1` will respond with 10 pictures of pugs.

&& syntax will only execute the second command if the first command is valid.

## Installation

Add `hubot-command-chaining` to your package.json, run `npm install` and add hubot-ampersand to `external-scripts.json`.

Add hubot-ampersand to your `package.json` dependencies.

```
"dependencies": {
  "hubot-command-chaining": "some-version"
}
```

Add `hubot-command-chaining` to `external-scripts.json`.

```
> cat external-scripts.json
> ["hubot-command-chaining"]
```

## Usage
  //TODO

