# Proxy Pattern

## Uses
Controlling access to an object or providing location-independent access to an object.

## Pros
Using a proxy for protection allows for separation of concerns: the original obj does its thing and the proxy is only concerned about protecting that original object.  (Ex `BankAccount` and `BankAccountProtectionProxy`)

## Cons
It can seem a little clunky when you could may be able to add the new behavior into the existing class.
