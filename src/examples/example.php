<?php

use JetBrains\PhpStorm\ArrayShape;

$globalVariable = 1;

const CONSTANT = 1;

function abc(int $number = 10): int
{
    return $number;
}

class UnusedClass
{

}

/**
 * @deprecated
 */
class DeprecatedClass
{
    public const FOO = 1;
}

final class MyClass
{
    public string $publicProperty = "ttt";

    private string $unusedProperty = "unused\0";

    public const HELLO = 25.5;

    /**
     * @param string $property1 Some property
     */
    public function __construct(string $property1)
    {
        $this->publicProperty = $property1;
        $hello = 123 + self::HELLO;
    }

    public static function foo(): void
    {
        $abc = abc(number: (int)123.4);
        var_dump($abc);

        $typoa = "1";
        echo $typoa;
    }

    #[ArrayShape(["foo" => "string"])]
    public function something(): array
    {
        return [
            "foo" => "bar",
        ];
    }
}

$heredoc = <<<HEREDOC
hello world
how it is going?
HEREDOC;

MyClass::foo();

echo CONSTANT;

echo DeprecatedClass::FOO;

echo MyClass::HELLO;

labelToEnd:
