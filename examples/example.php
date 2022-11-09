<?php

use JetBrains\PhpStorm\ArrayShape;
use DateTimeImmutable as AliasedDateTimeImmutable;

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

interface InterfaceSome {

}

final class MyClass implements InterfaceSome
{
    public bool $publicProperty = true;

    public DeprecatedClass $hello;

    private string $unusedProperty = "unused this is a tyop\0";

    public const HELLO = 25.5;

    public static int $counter = 0;

    /**
     * @param string $property1 Some property
     */
    public function __construct(public string $property1)
    {
        $this->publicProperty = $undefinedVariable;
        $unusedLocalVariable = 123 + self::HELLO;
    }

    public static function foo(): void
    {
        $abc = abc(number: (int)123.4);
        var_dump($abc);
        self::$counter += 1;

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

$datetime = new AliasedDateTimeImmutable();

MyClass::foo();

echo CONSTANT;

echo DeprecatedClass::FOO;

echo MyClass::HELLO;

labelToEnd:

