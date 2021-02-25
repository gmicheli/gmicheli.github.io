# SageMath verification script to check the discrete log
# of Tower NFS computation in GF(p^6).

p = 135066410865995223349603927
ell = 18242935344221832539906081412848119704309124424217403
cof = (p**6-1) // ell

# Construction of the finite field
Fp = GF(p)
FpX.<X> = Fp[]
h = X^3 - X + 1
Fp3.<t> = Fp.extension(h)
Fp3.<Y> = Fp3[]
phiY = Y^2 + 64417723306991464419622353*Y + 1
Fp6.<x> = Fp3.extension(phiY);

# Generator and target element
gen = t + x
target = ( 31415926535897932384626433 + 83279502884197169399375105*t + 82097494459230781640628620*t^2) + x*( 89986280348253421170679821 + 48086513282306647093844609*t + 55058223172535940812848111*t^2)

# Logarithm of target, as computed with TNFS:
log_target = 7627280816875322297766747970138378530353852976315498

# Check that this is indeed the log modulo ell:
(gen^cof)^log_target == (target^cof)
