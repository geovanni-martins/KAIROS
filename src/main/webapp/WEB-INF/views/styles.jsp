<script>
    tailwind.config = {
        theme: {
            extend: {
                fontFamily: {
                    sora: ['Sora', 'sans-serif']
                },
                colors: {
                    background: '#0B101E',
                    surface: '#161F35',
                    'surface-hover': '#1D2B48',
                    divider: '#1D2B48',
                    brand: '#E16144',
                    'brand-dark': '#C9523A',
                    content: '#ffffff',
                    muted: '#8494b0',
                    success: '#22c55e',
                    warning: '#f59e0b',
                    danger: '#E16144'
                }
            }
        }
    };
</script>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Sora:wght@100..800&display=swap');

    :root {
        --color-background: #0B101E;
        --color-surface: #161F35;
        --color-surface-hover: #1D2B48;
        --color-divider: #1D2B48;
        --color-brand: #E16144;
        --color-brand-dark: #C9523A;
        --color-content: #ffffff;
        --color-muted: #8494b0;
        --color-success: #22c55e;
        --color-warning: #f59e0b;
        --color-danger: #E16144;
    }

    body {
        margin: 0;
        font-family: 'Sora', sans-serif;
        background-color: var(--color-background);
        color: var(--color-content);
    }

    #alert-error,
    #alert-success,
    #success-alert {
        transition: opacity 0.3s ease;
    }

    ::placeholder {
        color: rgba(132, 148, 176, 0.72);
    }

    .bg-background { background-color: var(--color-background); }
    .bg-surface { background-color: var(--color-surface); }
    .bg-surface-hover { background-color: var(--color-surface-hover); }
    .bg-brand { background-color: var(--color-brand); }
    .bg-brand-dark { background-color: var(--color-brand-dark); }
    .bg-success { background-color: var(--color-success); }
    .bg-warning { background-color: var(--color-warning); }
    .bg-danger { background-color: var(--color-danger); }

    .text-content { color: var(--color-content); }
    .text-muted { color: var(--color-muted); }
    .text-brand { color: var(--color-brand); }
    .text-brand-dark { color: var(--color-brand-dark); }
    .text-success { color: var(--color-success); }
    .text-warning { color: var(--color-warning); }
    .text-danger { color: var(--color-danger); }

    .border-divider { border-color: var(--color-divider); }
    .border-brand { border-color: var(--color-brand); }
    .border-success { border-color: var(--color-success); }
    .border-warning { border-color: var(--color-warning); }
    .border-danger { border-color: var(--color-danger); }

    .font-sora { font-family: 'Sora', sans-serif; }
</style>
