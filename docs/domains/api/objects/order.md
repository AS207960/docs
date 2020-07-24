# Generic order fields

An order tracks the progress of a chargeable action.

## Object field description

These fields are common to all orders.

### `url`
> Read only

The canonical URL of this resource in the API  

### `id`
> Read only

The ID of this object. It is currently a UUID but do not make assumptions about its
format, treat it as an opaque identifier.

### `state`

A the current order state. Valid values are;

* `pending`
* `started`
* `processing`
* `needs_payment`
* `pending_approval`
* `completed`
* `failed`

The valid state transitions are as follows;

* `pending` is an entry state
* `started` is an entry state
* from `pending`
    * to `started`
    * to `failed`
* from `started`
    * to `processing`
    * to `needs_payment`
    * to `failed`
* from `needs_payment`
    * to `processing`
    * to `failed`
* from `processing` 
    * to `pending_approval`
    * to `completed`
    * to `failed`
* from `pending_approval`
    * to `completed`
    * to `failed`
* `completed` is a terminal state
* `failed` is a terminal state

Can only be updated by an API call in the `pending` state.
Will automatically be set to `started` for orders created with the API.

### `redirect_uri`
> Read only, nullable

The page to redirect a user to in case interactivity is required.

### `last_error`
> Read only, nullable

The last error encountered whilst registering the domain. If in the `failed` state, 
this is the reason for failure.

### `price`
> Read only

The cost associated with this order, in GBP.

### `off_session`
> Write once

If true then a user isn't present to handle interactive tasks, and `redirect_uri` will
never be set, if false the opposite is true.

Defaults to `true`.