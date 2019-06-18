//
// Copyright 2019 Bloomberg Finance L.P.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Foundation
@testable import XCDiffCore
import XCTest

final class UniversalResultRendererTests: XCTestCase {
    private let fixtures = Fixtures()

    func testRender_whenConsoleAndVerboseFalse() throws {
        // Given
        let sut = UniversalResultRenderer(format: .console, verbose: false)
        let result = fixtures.projectCompareResult.sample1()

        // When
        let actual = try sut.render(result)

        // Then
        XCTAssertEqual("""
        ❌ TAG1 > Context1 > Context2
        ❌ TAG2 > Context1 > Context2

        """, actual)
    }

    func testRender_whenMarkdownAndVerboseFalse() throws {
        // Given
        let sut = UniversalResultRenderer(format: .markdown, verbose: false)
        let result = fixtures.projectCompareResult.sample1()

        // When
        let actual = try sut.render(result)

        // Then
        XCTAssertEqual("""

        ## ❌ TAG1 > Context1 > Context2\n

        ## ❌ TAG2 > Context1 > Context2\n\n
        """, actual)
    }

    // swiftlint:disable:next function_body_length
    func testRender_whenJSONAndVerboseFalse() throws {
        // Given
        let sut = UniversalResultRenderer(format: .json, verbose: false)
        let result = fixtures.projectCompareResult.sample1()

        // When
        let actual = try sut.render(result)

        // Then
        XCTAssertEqual("""
        [
          {
            "context" : [
              "Context1",
              "Context2"
            ],
            "differentValues" : [
              {
                "context" : "DV1"
              },
              {
                "context" : "DV2"
              },
              {
                "context" : "DV3",
                "first" : "DV3_V1",
                "second" : "DV3_V2"
              },
              {
                "context" : "DV4",
                "first" : "DV4_V1",
                "second" : "DV4_V2"
              }
            ],
            "onlyInFirst" : [
              "OIF1",
              "OIF2"
            ],
            "onlyInSecond" : [
              "OIS1",
              "OIS2",
              "OIS3"
            ],
            "tag" : "Tag1"
          },
          {
            "context" : [
              "Context1",
              "Context2"
            ],
            "differentValues" : [
              {
                "context" : "DV1"
              },
              {
                "context" : "DV2"
              },
              {
                "context" : "DV3",
                "first" : "DV3_V1",
                "second" : "DV3_V2"
              },
              {
                "context" : "DV4",
                "first" : "DV4_V1",
                "second" : "DV4_V2"
              }
            ],
            "onlyInFirst" : [
              "OIF1",
              "OIF2"
            ],
            "onlyInSecond" : [
              "OIS1",
              "OIS2",
              "OIS3"
            ],
            "tag" : "Tag2"
          }
        ]
        """, actual)
    }
}