# Contributing to LibraryName

Thank you for considering contributing to this Arduino library!

## Code of Conduct

Be respectful, constructive, and welcoming to all contributors.

## How to Contribute

### Reporting Bugs

1. Check if the bug has already been reported in Issues
2. Create a new issue with a clear title and description
3. Include:
   - Arduino board and IDE version
   - Minimal code to reproduce the issue
   - Expected vs. actual behavior
   - Error messages or serial output

### Suggesting Enhancements

1. Open an issue with the tag "enhancement"
2. Describe the feature and its use case
3. Explain why it would be useful to users

### Pull Requests

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature-name`
3. Make your changes following the code style guidelines
4. Test your changes thoroughly
5. Commit with clear, descriptive messages
6. Push to your fork
7. Open a Pull Request with a clear description

## Code Style Guidelines

### General Rules

- Follow Arduino coding style conventions
- Use meaningful variable and function names
- Keep functions small and focused
- Comment complex logic, but write self-documenting code when possible

### C++ Conventions

- Class names: `PascalCase`
- Public methods: `camelCase`
- Private members: `_camelCase` (prefix with underscore)
- Constants: `UPPER_CASE`
- Indentation: 2 spaces (no tabs)

### File Organization

- Header guards: `#ifndef LIBRARY_NAME_H`
- Include order: Arduino headers, library headers, local headers
- Keep public API in header files
- Keep implementation details private

### Examples

- Examples should compile without warnings
- Use descriptive names for example sketches
- Keep examples simple and focused
- Comment important steps
- No library logic in examples (only usage)

## Testing

Before submitting a PR:

1. Compile all examples without errors or warnings
2. Test on actual hardware if possible
3. Verify CI passes on GitHub
4. Check that library.properties is valid

## Documentation

- Update README.md if adding features
- Add comments to public API methods
- Update examples if API changes
- Keep documentation beginner-friendly

## Git Commit Messages

- Use present tense: "Add feature" not "Added feature"
- Use imperative mood: "Fix bug" not "Fixes bug"
- First line: brief summary (50 chars or less)
- Blank line, then detailed description if needed
- Reference issues: "Fixes #123"

### Example Commit Messages

```
Add temperature reading method

Implement getTemperature() method that returns
float value in Celsius. Includes error handling
for sensor failures.

Fixes #42
```

## Questions?

Open an issue or discussion if you need help or clarification.

Thank you for contributing!
