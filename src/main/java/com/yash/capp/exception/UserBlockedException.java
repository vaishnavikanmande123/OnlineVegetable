package com.yash.capp.exception;

public class UserBlockedException extends Exception{
    /**
     * Creates user object without error description
     */
    public UserBlockedException()
    {

    }

    /**
     * with error description
     * @param errDesc
     */
    public UserBlockedException(String errDesc)
    {
        super(errDesc);
    }
}
