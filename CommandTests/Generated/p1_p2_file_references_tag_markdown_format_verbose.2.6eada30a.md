# Command
```json
["-p1", "{ios_project_1}", "-p2", "{ios_project_2}", "-g", "file_references", "-f", "markdown", "-v"]
```

# Expected exit code
2

# Expected output
```

## ❌ FILE_REFERENCES


### ⚠️  Only in first (7):

  - `Project/Group B/AViewController.xib`
  - `Project/Group B/AnotherObjcClass.h`
  - `Project/Group B/AnotherObjcClass.m`
  - `Project/Resources/time.png`
  - `ProjectTests/BarTests.swift`
  - `ProjectUITests/LoginTests.swift`
  - `ProjectUITests/Screenshots/empty.png`


### ⚠️  Only in second (9):

  - `NewFramework.framework`
  - `NewFramework/Info.plist`
  - `NewFramework/NewFramework.h`
  - `Project/Project.xcconfig`
  - `Project/Target.xcconfig`
  - `ProjectFramework/Header4.h`
  - `ProjectTests/Responses/ListResponse.json`
  - `ProjectUITests/MetricsTests.swift`
  - `README.md`




```
