import Test.Framework
import Test.Framework.Providers.HUnit
import Test.HUnit
import Solution


-- https://github.com/hspec/HUnit

shouldFindExpression = TestCase $
 assertEqual
    "given 1,3,7,10,25,50 and target 765 then should find at least one expression"
        (null (solutions'' [1,3,7,10,25,50] 765))
        False

shouldNotFindExpression = TestCase $
 assertEqual
    "given 1,3,7,10,25,50 and target 831 then should not find any expression"
        (null (solutions'' [1,3,7,10,25,50] 831))
        True

-- hUnitTestToTests: Adapt an existing HUnit test into a list of test-framework tests
tests = hUnitTestToTests $ TestList [TestLabel "shouldFindExpression" shouldFindExpression,
                                     TestLabel "shouldNotFindAnyExpression" shouldNotFindExpression]

main = defaultMain tests