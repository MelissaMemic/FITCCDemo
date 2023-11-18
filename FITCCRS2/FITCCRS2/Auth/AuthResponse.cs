namespace FITCCRS2.Auth
{
    public class AuthResponse:BaseResponse
    {
        public AuthResponse(Guid correlationId) : base(correlationId)
        {
        }

        public AuthResponse()
        {
        }
        public bool Result { get; set; } = false;
        public string Token { get; set; } = string.Empty;
        public string Username { get; set; } = string.Empty;
        public bool IsLockedOut { get; set; } = false;
        public bool IsNotAllowed { get; set; } = false;
        public bool RequiresTwoFactor { get; set; } = false;
    }
}
