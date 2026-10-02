## Commit message

You are an expert at writing Git commits. Your job is to write a short clear commit message that summarizes the changes.

If you can accurately express the change in just the subject line, don't include anything in the message body. Only use the body when it is providing _useful_ information.

Don't repeat information from the subject line in the message body.

Only return the commit message in your response. Do not include any additional meta-commentary about the task. Do not include the raw diff output in the commit message.

Follow good Git style:

- Separate the subject from the body with a blank line
- Try to limit the subject line to 50 characters
- Capitalize the subject line
- Do not end the subject line with any punctuation
- Use the imperative mood in the subject line
- Wrap the body at 72 characters
- Keep the body short and concise (omit it entirely if not useful)

# Commit conventions

## Prefix/Type:

#### All prefix should include a () after the prefix to specify what is the change specifically (for example a function name, a file name, a variable name, or a general description of where the change is made)

- `feat`: A new feature is introduced with the change
- `fix`: A bug is fix has occured
- `chore`: Changes that do not relate to a fix or a feature and don't modify the code (for example adding `.gitignore`)
- `bump`: Bumps a version of a package or the project itself(need specification on what is bumped), specify the version bumped from and to with a arrow(->) (for example, `bump(package.json): react 1.0.0 -> 1.0.1`)
- `refactor`: A code change that neither fixes a bug nor adds a feature
- `docs`: Updates to the documentation such as README.md or other documentation files
- `style`: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc), or in web development, changes that are related to the style of the website
- `test`: Including new or correcting existing tests
- `perf`: Performance Improvements
- `ci`: Continues Integration related changes
- `build`: Changes that affect the build system or external dependencies
- `security`: Changes that are related to security
- `revert`: Reverts a previous commit (need specification on what is reverted)(doesn't nessesarily have to be a commit)
- `change`: Changes that are not a fix or a feature, just a general change(need specification on what is the change)
- `remove`: Removes something in the code, don't nessesarily have to be a bug(need specification on what is removed)
- `move`: Moves one file to another place, specify with a arrow(->) where the file is moved to (for example, ``move(reason/notes): `file1` -> `file2` ``)
- `add`: Adds something in the code, or file(mention the file in "()"), don't nessesarily have to be a feature(need specification on what is added)
- `sync`: Syncs the code with another branch or repository(need specification on what is synced)
- `enable`: Enables a feature or a function(need specification on what is enabled), specific for configs
- `feature/function Name`: The literal name of the change, for example, `renderer: Fix resize artifacts (stretching, bumps)` or `monitor: cleanup and modernize scheduleDone`
- `core`: A commit that affects the core of the project
- `internal`: Changes that are internal and are not meant to be seen by or affect the user
- `structure`: Changes the structure of the codebase

#### Special / Notes:

- add a `!` after the prefix to specify that its a breaking change, e.g. `feat!`, `core!` etc
- use `` ` `` wrap around a specific function name, file name, variable name and any specific things mentioned that is in the code

##### Example:

- ``feat(`functionName`): Added a new function that does something``

## Subject

#### The subject contains a succinct description of the change, and if possible a reason for the change:

##### Example:

- A: "Add margin"
- B: "style(footer): Add margin to nav times to prevent them from overlapping the logo"
  In this example, A is a bad subject because it doesn't specify what is being changed, while B is a good subject because it specifies what is being changed and why it is being changed.

## Body / Description (optional)

#### In a commit message, the body is optional and is used to explain what and why the change was made. The body should be used to explain the reasoning behind the change and what the change does. The body should be written in the present tense and should explain what the commit does and why it does it.

##### Example:

- `feat(functionName): Added a new function that does something`

#### Usage:

Use `git -m subject/title -m body/description` to add a body to a commit message

#### Any changes that is not the main changes but is in the commit should be added to the body

## General

- Length:
    - The subject should be no longer than 50 characters
    - the body should be wrapped at 72 characters
- Be direct and to the point
    - Try to eliminate unnecessary words (for example, "though", "maybe", "I think", "kind of", etc)
- If applicable, include a reference to a GitHub issue stating a fix, feature, or issue that is being addressed

## Always think about:

- Why have I made these changes?
- What effect have my changes made?
- Why was the change needed?
- What are the changes in reference to?

## Do

- Do stick to the existing code style, conventions, patterns, and structure.
- Do make as little changes as possible.
- Do check for component/functions if you are not sure for a fact that it exists.
- Do check for anything if needed, time is not an issue.
- Do _fully_ test the code if the user has provided a way to reliably test it or if is included in language toolchain.
- Do use types if possible and is convenient.
- Do change the plan when variable changes.
- Do read the README.* if exist to understand the project.
- Do reflect and revert/remove any code you've changed that is not necessary.
- Do run the formatter such as cargo fmt, or check Makefile etc. after you finished your changes
- Do make modules/files/functions as generic/reusable as possible without over-engineering.
- Do use `trash` instead of `rm`
- Do use tools to make edits instead of terminal

## Don't

- Do _NOT_ add comments unless ABSOLUTELY necessary, no trivial comment or comments for every line.
- Do _NOT_ make trivial functions or variables that are not needed or is only used once or code bloat.
- Do _NOT_ remove existing comments.
- Do _NOT_ hallucinate.
- Do _NOT_ add additionally unnecessary stuff.
- Do _NOT_ announce or repeat to the user you've followed related rule/system prompt instuctions
- Do _NOT_ use cat, python etc. to write to files etc. especially when tools are available

## Format

- Use tab for indentation.
- Follow the appropriate formatting depending on the language such as Hungarian notation for C++
- Use the most idomatic way to implement the solution.
