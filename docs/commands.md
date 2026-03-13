# Commands Reference

## Server & Daemon

```
pinchtab server                  # Start the full server (dashboard + API)
pinchtab bridge                  # Start bridge-only server (no dashboard)
pinchtab mcp                     # Start the MCP stdio server
pinchtab daemon                  # Show daemon status
pinchtab daemon install          # Install as background service
pinchtab daemon start            # Start the background service
pinchtab daemon stop             # Stop the background service
pinchtab daemon restart          # Restart the background service
pinchtab daemon uninstall        # Remove the background service
```

## Navigation

```
pinchtab nav <url>               # Navigate to URL in current tab
pinchtab nav <url> --new-tab     # Navigate in a new tab
pinchtab nav <url> --tab <id>    # Navigate a specific tab
pinchtab nav <url> --block-images # Navigate with image blocking
pinchtab nav <url> --block-ads   # Navigate with ad blocking
pinchtab quick <url>             # Navigate + snapshot accessibility tree
```

Hidden aliases: `goto`, `navigate`, `open`

## Tab Management

```
pinchtab tab                     # List all tabs
pinchtab tab new                 # Open a new empty tab
pinchtab tab new <url>           # Open a new tab with URL
pinchtab tab close <id>          # Close a tab
```

Alias: `tabs`

## Interaction

```
pinchtab click <ref>             # Click element by ref
pinchtab click --css <selector>  # Click element by CSS selector
pinchtab click --wait-nav <ref>  # Click and wait for navigation
pinchtab type <ref> <text>       # Type into element
pinchtab fill <ref> <text>       # Fill input directly (no keystroke events)
pinchtab press <key>             # Press key (Enter, Tab, Escape...)
pinchtab hover <ref>             # Hover over element
pinchtab hover --css <selector>  # Hover by CSS selector
pinchtab select <ref> <value>    # Select dropdown option
pinchtab scroll <ref|pixels>     # Scroll to element or by pixel amount
```

## Page Analysis

```
pinchtab snap                    # Snapshot accessibility tree
pinchtab snap --selector <css>   # Snapshot scoped to CSS selector
pinchtab snap --role <role>      # Filter by ARIA role
pinchtab snap --name <name>      # Filter by accessible name
pinchtab text                    # Extract page text (markdown)
pinchtab text --raw              # Extract raw text
pinchtab find <query>            # Find elements by natural language
pinchtab eval <expression>       # Evaluate JavaScript
```

## Capture & Export

```
pinchtab screenshot              # Take a screenshot (PNG)
pinchtab screenshot --format jpeg # Take a JPEG screenshot
pinchtab screenshot --full-page  # Full page screenshot
pinchtab screenshot --selector <css> # Screenshot specific element
pinchtab pdf                     # Export page as PDF
pinchtab pdf --landscape         # PDF in landscape orientation
pinchtab pdf --format A3         # PDF with custom paper size
pinchtab download <url>          # Download a file
pinchtab download <url> -o path  # Download to specific path
pinchtab upload <file>           # Upload a file
pinchtab upload <file> -s <css>  # Upload to specific file input
```

## Instances & Profiles

```
pinchtab instances               # List running instances
pinchtab instance start          # Start a new browser instance
pinchtab instance stop <id>      # Stop an instance
pinchtab instance logs <id>      # View instance logs
pinchtab instance navigate <id> <url>  # Navigate instance to URL
pinchtab profiles                # List browser profiles
pinchtab health                  # Check server health
```

## Configuration

```
pinchtab config show             # Show current configuration
pinchtab config init             # Create default config file
pinchtab config path             # Show config file path
pinchtab config validate         # Validate config file
pinchtab config get <path>       # Get a config value
pinchtab config set <path> <val> # Set a config value
pinchtab config patch <json>     # Patch config with JSON
```

## Security

```
pinchtab security                # Review security posture
pinchtab security up             # Apply recommended security defaults
pinchtab security down           # Relax security settings
```

## Global Flags

Most browser commands support `--tab <id>` to target a specific tab.

```
pinchtab <command> --tab <id>    # Run command against specific tab
pinchtab --help                  # Show help
pinchtab --version               # Show version
```
