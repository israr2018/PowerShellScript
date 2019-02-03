Try {
    echo " ::Do some work..."
    echo " ::Try divide by zero: $(0/0)"
} Catch {
    echo "  ::Cannot handle the error (will rethrow): $_"
    throw $_
} Finally {
    echo " ::Cleanup resources..."
}